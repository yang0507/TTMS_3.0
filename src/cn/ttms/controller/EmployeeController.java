package cn.ttms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.utils.Page;
import cn.ttms.pojo.Employee;
import cn.ttms.pojo.QueryVo;
import cn.ttms.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	
	@RequestMapping("/list")
	public String list(Model model,QueryVo vo) throws Exception{
		
		
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		//设置查询的起始记录条数
		vo.setStart((vo.getPage() - 1)* vo.getSize());
		
		List<Employee> empList = employeeService.queryEmployeeByVo(vo);
		Integer count = employeeService.queryEmployeeByVoCount(vo);
		Page<Employee> page = new Page<Employee>();
		page.setTotal(count);	//数据总数
		page.setSize(vo.getSize());		//每页显示条数
		page.setPage(vo.getPage());		//当前页数
		page.setRows(empList);		//当前查询出来的集合
		model.addAttribute("empName",vo.getEmpName());
		model.addAttribute("empTelNum",vo.getEmpTelNum());
		model.addAttribute("page", page);
		
		return "employee";
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public Employee detail(int id) throws Exception{
		Employee employee = employeeService.queruEmployeeById(id);
		return employee;
	}
	
	@RequestMapping("/update")
	public String update(Employee employee) throws Exception{
		employeeService.updateEmployeeById(employee);
		return "employee";
	}
	
	@RequestMapping("/delete")
	public String delete(int id) throws Exception {
		employeeService.deleteEmployeeById(id);
		return "employee";
	}
	
	@RequestMapping("/insert")
	public String insert(Employee employee) throws Exception{
		employeeService.insertEmployee(employee);
		return "employee";
	}
}
