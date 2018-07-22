package cn.ttms.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ttms.dao.EmployeeMapper;
import cn.ttms.pojo.Employee;
import cn.ttms.pojo.QueryVo;
import cn.ttms.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeMapper employeeMapper;

	@Override
	public List<Employee> queryEmployeeByVo(QueryVo vo) {
		List<Employee> list = employeeMapper.queryEmployeeByVo(vo);
		return list;
	}

	@Override
	public Integer queryEmployeeByVoCount(QueryVo vo) {
		Integer count = employeeMapper.queryEmployeeByVoCount(vo);
		return count;
	}

	@Override
	public Employee queruEmployeeById(int id) {
		Employee employee = employeeMapper.queruEmployeeById(id);
		return employee;
	}

	@Override
	public void updateEmployeeById(Employee employee) {
		employeeMapper.updateEmployeeById(employee);
	}

	@Override
	public void deleteEmployeeById(int id) {
		employeeMapper.deleteEmployeeById(id);
		
	}

	@Override
	public void insertEmployee(Employee employee) {
		employeeMapper.insertEmployee(employee);
	}

	@Override
	public List<Employee> queruEmployeeAll() {
		List<Employee> list = employeeMapper.queruEmployeeAll();
		return list;
	}

	@Override
	public String queryemailByNo(String no) {
		String email = employeeMapper.queryemailByNo(no);
		return email;
	}
	

	
}
