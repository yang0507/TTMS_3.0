package cn.ttms.pojo;

public class User {
	/*
	 *`emp_no` varchar(20) NOT NULL COMMENT '用户�?',
	  `emp_pass` varchar(20) NOT NULL COMMENT '密码',
	  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户类型�?0为普通用户，1是管理员',
	  PRIMARY KEY (`emp_no`),
	  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE
	 */
	private String emp_no;
	private String emp_pass;
	private int type;
	private int status;
	private String activation_code;
	private Employee employee;
	public String getActivation_code() {
		return activation_code;
	}
	public void setActivation_code(String activation_code) {
		this.activation_code = activation_code;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_pass() {
		return emp_pass;
	}
	public void setEmp_pass(String emp_pass) {
		this.emp_pass = emp_pass;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public User(String emp_no, String emp_pass, short type) {
		super();
		this.emp_no = emp_no;
		this.emp_pass = emp_pass;
		this.type = type;
	}
	
	public User() {
	
	}
	
	
	

}
