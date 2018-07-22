package cn.ttms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ttms.pojo.Employee;
import cn.ttms.pojo.User;
import cn.ttms.service.EmployeeService;
import cn.ttms.service.UserService;
import cn.ttms.utils.MD5Utils;

@Controller
@RequestMapping("/admin")
public class OnlyYouController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private UserService userService;
	
	//ֻ���û������ͨ����������·��
	@RequestMapping("/onlyYou")
	public String onlyYou() {
		
		return "onlyYou";
	}
	
	//�޸Ļ�����Ϣ
	@RequestMapping("updateemployee")
	public String updateEmp(Employee employee) {
		
		employeeService.updateEmployeeById(employee);
		
		return "onlyYou";
	}
	
	//�޸ĵ�¼����
	@RequestMapping("updateUser")
	public String updateUs(User user) {
		
		user.setEmp_pass(MD5Utils.md5Code(user.getEmp_pass()+user.getEmp_no()));
		userService.updatePassByVo(user);
		
		return "onlyYou";
	}
	
}
