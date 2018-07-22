package cn.ttms.dao;

import java.util.List;

import javax.management.Query;

import cn.ttms.pojo.Employee;
import cn.ttms.pojo.QueryVo;

public interface EmployeeMapper {
	List<Employee> queryEmployeeByVo(QueryVo vo);
	Integer queryEmployeeByVoCount(QueryVo vo);
	
	List<Employee> queruEmployeeAll();
	
	Employee queruEmployeeById(int id);
	void updateEmployeeById(Employee employee);
	
	void deleteEmployeeById(int id);
	
	void insertEmployee(Employee employee);	
	
	String queryemailByNo(String no);
	
}
