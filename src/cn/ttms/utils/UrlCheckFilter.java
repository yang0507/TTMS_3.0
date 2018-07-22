package cn.ttms.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ttms.pojo.User;
/***
 * 处理登录鉴权问题 
 * 不同身份的人只能访问特定的路径
 * @author 杨召
 *
 */
public class UrlCheckFilter implements Filter {

	
    public UrlCheckFilter() {

    }

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		User loginingUser = (User)req.getSession().getAttribute("loginingUser");
		
		String uri = req.getRequestURI();
		if(uri.contains("login")&&loginingUser==null) {
			chain.doFilter(request, response);
		}else if(loginingUser==null) {
			resp.sendRedirect(req.getContextPath()+"/login.jsp");
		}else {
			//已激活
			if(loginingUser.getStatus()==1) {
				//售票员
				if(loginingUser.getType()==0) {
					//只有卖票、登录、退出、修改自己资料的权限
					if(uri.contains("login")||uri.contains("sellTickets")||uri.contains("ticket")||uri.contains("admin")||uri.contains("sale_item")) {
						chain.doFilter(request, response);
					}else {
						resp.sendRedirect(req.getContextPath()+"/sellTickets/list.action");
					}
				}
				//管理员
				if(loginingUser.getType()==1) {
					//拥有除登录用户管理的权限
					if(uri.contains("user")) {
						resp.sendRedirect(req.getContextPath()+"/schedule/list.action");
					}else {
						chain.doFilter(request, response);
					}
				}
				//经理
				if(loginingUser.getType()==2) {
					//拥有所有权限
					chain.doFilter(request, response);
				}
			}
			//未激活
			else {
				resp.sendRedirect(req.getContextPath()+"/activate.jsp");
			}

		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
