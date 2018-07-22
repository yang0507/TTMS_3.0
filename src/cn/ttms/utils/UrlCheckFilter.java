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
 * �����¼��Ȩ���� 
 * ��ͬ��ݵ���ֻ�ܷ����ض���·��
 * @author ����
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
			//�Ѽ���
			if(loginingUser.getStatus()==1) {
				//��ƱԱ
				if(loginingUser.getType()==0) {
					//ֻ����Ʊ����¼���˳����޸��Լ����ϵ�Ȩ��
					if(uri.contains("login")||uri.contains("sellTickets")||uri.contains("ticket")||uri.contains("admin")||uri.contains("sale_item")) {
						chain.doFilter(request, response);
					}else {
						resp.sendRedirect(req.getContextPath()+"/sellTickets/list.action");
					}
				}
				//����Ա
				if(loginingUser.getType()==1) {
					//ӵ�г���¼�û������Ȩ��
					if(uri.contains("user")) {
						resp.sendRedirect(req.getContextPath()+"/schedule/list.action");
					}else {
						chain.doFilter(request, response);
					}
				}
				//����
				if(loginingUser.getType()==2) {
					//ӵ������Ȩ��
					chain.doFilter(request, response);
				}
			}
			//δ����
			else {
				resp.sendRedirect(req.getContextPath()+"/activate.jsp");
			}

		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
