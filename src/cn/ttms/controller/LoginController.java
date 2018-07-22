package cn.ttms.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ttms.pojo.User;
import cn.ttms.service.LoginService;
import cn.ttms.utils.MD5Utils;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request,HttpServletResponse response,Model model) throws Exception {
		user.setEmp_pass(MD5Utils.md5Code(user.getEmp_pass()+user.getEmp_no()));
		//验证码检测
		if(request.getParameter("checkcode").equals((String) request.getServletContext().getAttribute("cleckvalue"))) {
			
			if(loginService.checkStatus(user)==0) {
				//未激活
				System.out.println("未激活");
			}else {
				//已激活
				//检查登陆情况
				User userLoging = loginService.checklogin(user);
				if(userLoging!=null) {
					//将登录用户信息放入session
					request.getSession().setAttribute("loginingUser", userLoging);
//					System.out.println(((User) request.getSession().getAttribute("loginingUser")).getType());
					//根据不同的身份跳转不同页面
					if(userLoging.getType()==0) {
						//售票员跳转至售票列表
						return "redirect:/sellTickets/list.action";
					}else if(userLoging.getType()==1) {
						//管理员跳转至演出计划列表
						return "redirect:/schedule/list.action";
					}else if(userLoging.getType()==2) {
						//经理跳转至登录用户管理列表
						return "redirect:/user/list.action";
					}
				}else {
					return "redirect:/login.jsp";
				}
			}
		}else {
			//验证码出错
			request.getSession().setAttribute("checkError",0);
			return "redirect:/login.jsp";
		}
		return "redirect:/login.jsp";
	}
	
	@RequestMapping("/quit")
	public String quit(HttpServletRequest request) throws Exception {
		request.getSession().invalidate();
		return "redirect:/login.jsp";
	}
	
	@RequestMapping("/checkstatus")
	public String checkStatus(String no,HttpServletRequest req) throws Exception{
		req.getSession().setAttribute("userStatus", loginService.checkstatusByNo(no));
//		model.addAttribute("userStatus", loginService.checkstatusByNo(no));
		return "forward:/login.jsp";
	}
	
	@RequestMapping("/activateuser")
	public String activateuser(User user) throws Exception{
		
		loginService.activateuser(user);
		
		return "redirect:/activate.jsp";
	}
}
