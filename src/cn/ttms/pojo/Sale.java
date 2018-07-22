package cn.ttms.pojo;

import java.sql.Timestamp;

public class Sale {
	/*
	 * 	  `sale_ID` bigint(20) NOT NULL AUTO_INCREMENT,
		  `emp_id` int(11) DEFAULT NULL,
		  `sale_time` datetime DEFAULT NULL,
		  `sale_payment` decimal(10,2) DEFAULT NULL,
		  `sale_change` decimal(10,2) DEFAULT NULL,
		  `sale_type` smallint(6) DEFAULT NULL COMMENT '类别取�?�含义：\r\n            1：销售单\r\n            -1：�??款单',
		  `sale_status` smallint(6) DEFAULT NULL COMMENT '�?售单状�?�如下：\r\n            0：代付款\r\n            1：已付款',
		  PRIMARY KEY (`sale_ID`),
		  KEY `FK_employee_sale` (`emp_id`),
		  CONSTRAINT `FK_employee_sale` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
	 */
	
	private int sale_id;
	private int emp_id;
	private Timestamp sale_time;
	private double sale_payment;
	private double sale_change;
	private int sale_type;
	private int sale_status;
	private Employee employee;
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public int getSale_type() {
		return sale_type;
	}
	public void setSale_type(int sale_type) {
		this.sale_type = sale_type;
	}
	public int getSale_status() {
		return sale_status;
	}
	public void setSale_status(int sale_status) {
		this.sale_status = sale_status;
	}
	public Sale(){
		
	}
	public Sale(int sale_id, int emp_id, Timestamp sale_time, double sale_payment, double sale_change, short sale_type,
			short sale_status) {
		super();
		this.sale_id = sale_id;
		this.emp_id = emp_id;
		this.sale_time = sale_time;
		this.sale_payment = sale_payment;
		this.sale_change = sale_change;
		this.sale_type = sale_type;
		this.sale_status = sale_status;
	}
	public int getSale_id() {
		return sale_id;
	}
	public void setSale_id(int sale_id) {
		this.sale_id = sale_id;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public Timestamp getSale_time() {
		return sale_time;
	}
	public void setSale_time(Timestamp sale_time) {
		this.sale_time = sale_time;
	}
	public double getSale_payment() {
		return sale_payment;
	}
	public void setSale_payment(double sale_payment) {
		this.sale_payment = sale_payment;
	}
	public double getSale_change() {
		return sale_change;
	}
	public void setSale_change(double sale_change) {
		this.sale_change = sale_change;
	}

}
