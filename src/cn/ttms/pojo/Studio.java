package cn.ttms.pojo;

public class Studio {
	/*
	 * `studio_id` int(11) NOT NULL AUTO_INCREMENT,
  		`studio_name` varchar(100) NOT NULL,
  		`studio_row_count` int(11) DEFAULT NULL,
  		`studio_col_count` int(11) DEFAULT NULL,
		 `studio_introduction` varchar(2000) DEFAULT NULL,
		 `studio_flag` smallint(6) DEFAULT NULL COMMENT '取�?�含义：\r\n                        0：尚未生成座位，可以根据行列信息生成座位\r\n                        1：已经根据影厅的座位信息安排了座位，不能再安排座位；\r\n                        -1：影厅损坏或者废弃，不能使用',
		 PRIMARY KEY (`studio_id`)
	 */
	
	private int studio_id;
	private String studio_name;
	private int studio_row_count;
	private int studio_col_count;
	private String studio_introduction;
	private int studio_flag;
	
	public Studio(){
	}
	public Studio(int studio_id, String studio_name, int studio_row_count, int studio_col_count,
			String studio_introduction, short studio_flag) {
		super();
		this.studio_id = studio_id;
		this.studio_name = studio_name;
		this.studio_row_count = studio_row_count;
		this.studio_col_count = studio_col_count;
		this.studio_introduction = studio_introduction;
		this.studio_flag = studio_flag;
	}
	public int getStudio_id() {
		return studio_id;
	}
	public void setStudio_id(int studio_id) {
		this.studio_id = studio_id;
	}
	public String getStudio_name() {
		return studio_name;
	}
	public void setStudio_name(String studio_name) {
		this.studio_name = studio_name;
	}
	public int getStudio_row_count() {
		return studio_row_count;
	}
	public void setStudio_row_count(int studio_row_count) {
		this.studio_row_count = studio_row_count;
	}
	public int getStudio_col_count() {
		return studio_col_count;
	}
	public void setStudio_col_count(int studio_col_count) {
		this.studio_col_count = studio_col_count;
	}
	public String getStudio_introduction() {
		return studio_introduction;
	}
	public void setStudio_introduction(String studio_introduction) {
		this.studio_introduction = studio_introduction;
	}
	public int getStudio_flag() {
		return studio_flag;
	}
	public void setStudio_flag(int studio_flag) {
		this.studio_flag = studio_flag;
	}
	
	
}
