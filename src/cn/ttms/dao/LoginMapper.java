package cn.ttms.dao;

import cn.ttms.pojo.User;

public interface LoginMapper {
	Integer checkStatus(User user);
	
	Integer checktype(User user);
	
	User checklogin(User user);
	
	String CheckactivationCode(User user);
	
	void activateuser(User user);
	
	Integer checkstatusByNo(String no);
}

