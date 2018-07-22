package cn.ttms.pojo;
/***
 * 查询时的javabean 附带分页的属性数据
 * @author 杨召
 *
 */
public class QueryVo {

//	private String custName;
//	private String custSource;
//	private String custIndustry;
//	private String custLevel;
	private String empName;
	private String empTelNum;
	private String playName;
	private String playLong;
	private String playType;
	private String studioName;
	private String p_name;
	private String st_name;
	private Integer schedid;
	private Integer seat_row;
	private Integer seat_col;
	private String dataDictName;
	private String dataDictParentId;
	private Integer page = 1;
	private Integer start;
	private Integer size = 8;
	
	//订单查询项
	
	private Integer sale_ticket_id;//票号
	private String sale_emp_no;//售票人编号
	private String sale_emp_name;//售票人名称
	private Integer sale_type;//订单的类型
	private String sale_time;//订单时间模糊
	
	public Integer getSale_ticket_id() {
		return sale_ticket_id;
	}
	public void setSale_ticket_id(Integer sale_ticket_id) {
		this.sale_ticket_id = sale_ticket_id;
	}
	public String getSale_emp_no() {
		return sale_emp_no;
	}
	public void setSale_emp_no(String sale_emp_no) {
		this.sale_emp_no = sale_emp_no;
	}
	public String getSale_emp_name() {
		return sale_emp_name;
	}
	public void setSale_emp_name(String sale_emp_name) {
		this.sale_emp_name = sale_emp_name;
	}
	public Integer getSale_type() {
		return sale_type;
	}
	public void setSale_type(Integer sale_type) {
		this.sale_type = sale_type;
	}
	public String getSale_time() {
		return sale_time;
	}
	public void setSale_time(String sale_time) {
		this.sale_time = sale_time;
	}
	public String getDataDictName() {
		return dataDictName;
	}
	public void setDataDictName(String dataDictName) {
		this.dataDictName = dataDictName;
	}
	public String getDataDictParentId() {
		return dataDictParentId;
	}
	public void setDataDictParentId(String dataDictParentId) {
		this.dataDictParentId = dataDictParentId;
	}
	public Integer getSchedid() {
		return schedid;
	}
	public void setSchedid(Integer schedid) {
		this.schedid = schedid;
	}
	public Integer getSeat_row() {
		return seat_row;
	}
	public void setSeat_row(Integer seat_row) {
		this.seat_row = seat_row;
	}
	public Integer getSeat_col() {
		return seat_col;
	}
	public void setSeat_col(Integer seat_col) {
		this.seat_col = seat_col;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getStudioName() {
		return studioName;
	}
	public void setStudioName(String studioName) {
		this.studioName = studioName;
	}
	public String getPlayName() {
		return playName;
	}
	public void setPlayName(String playName) {
		this.playName = playName;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpTelNum() {
		return empTelNum;
	}
	public void setEmpTelNum(String empTelNum) {
		this.empTelNum = empTelNum;
	}
	public String getPlayLong() {
		return playLong;
	}
	public void setPlayLong(String playLong) {
		this.playLong = playLong;
	}
	public String getPlayType() {
		return playType;
	}
	public void setPlayType(String playType) {
		this.playType = playType;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}

	
	
}
