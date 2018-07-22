package cn.ttms.service;

import java.util.List;


import cn.ttms.pojo.Employee;
import cn.ttms.pojo.QueryVo;

public interface EmployeeService {
	public List<Employee> queryEmployeeByVo(QueryVo vo);
	public Integer queryEmployeeByVoCount(QueryVo vo);
	
	public Employee queruEmployeeById(int id);
	
	public void updateEmployeeById(Employee employee);
	
	public void deleteEmployeeById(int id);
	
	public void insertEmployee(Employee employee);
	
	public List<Employee> queruEmployeeAll();
	
	public String queryemailByNo(String no);
}
