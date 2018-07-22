package cn.ttms.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.utils.Page;
import cn.ttms.pojo.Employee;
import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.User;
import cn.ttms.service.EmployeeService;
import cn.ttms.service.UserService;
import cn.ttms.utils.MD5Utils;
import cn.ttms.utils.MailUtil;


@Controller
@RequestMapping("/user")
public class UserController {
	
	
	@Autowired
	private UserService userService;
	@Autowired
	private EmployeeService employeeService;
	
	
	@RequestMapping("/list")
	public String list(Model model,QueryVo vo,Object obj) throws Exception{
		
		
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		//设置查询的起始记录条数
		vo.setStart((vo.getPage() - 1)* vo.getSize());
		List<Employee>  employeeList = employeeService.queruEmployeeAll();
		List<User> userList = userService.queryuserByVo(vo);
		Integer count = userService.queryuserByVoCount(vo);
		Page<User> page = new Page<User>();
		//提出两集合中重复元素
		for(int i = 0;i < employeeList.size(); i++){ 
            for(int j=0;j< userList.size();j++) {
            	if(employeeList.get(i).getEmp_no().equals(userList.get(j).getEmp_no())) {
            		employeeList.remove(i);
            	}
            } 
        }
		page.setTotal(count);	//数据总数
		page.setSize(vo.getSize());		//每页显示条数
		page.setPage(vo.getPage());		//当前页数
		page.setRows(userList);		//当前查询出来的集合
		model.addAttribute("empName",vo.getEmpName());
		model.addAttribute("empTelNum",vo.getEmpTelNum());
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("page", page);
		
		return "user";
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public User detail(String no) throws Exception{
		User user = userService.queryuserByNo(no);
		return user;
	}
	
	@RequestMapping("/update")
	public String update(User user) throws Exception{
		userService.updateuserByNo(user);
		return "user";
	}
	
	@RequestMapping("/updatePass")
	public String updatePass(String no ,User user) throws Exception{
		user.setEmp_no(no);
		user.setEmp_pass(MD5Utils.md5Code(no+no));
		userService.updatePassByVo(user);
		return "user";
	}
	
	@RequestMapping("/activation")
	public String activation(User user) throws Exception{
		userService.activationUser(user);
		return "user";
	}
	@RequestMapping("/delete")
	public String delete(String no) throws Exception {
		userService.deleteuserByNo(no);
		return "user";
	}
	
	@RequestMapping("/insert")
	public String insert(User user) throws Exception{
		
		user.setActivation_code(UUID.randomUUID().toString());
		String email = employeeService.queryemailByNo(user.getEmp_no());
		MailUtil.sendEmail(email,user.getActivation_code());
		//初始密码是编号 加盐值为其编号
		user.setEmp_pass(MD5Utils.md5Code(user.getEmp_no()+user.getEmp_no()));
		
		userService.insertuser(user);
		return "user";
	}
}
