package cn.ttms.service;

import cn.ttms.pojo.User;

public interface LoginService {
	public Integer checkStatus(User user);
	
	public Integer checktype(User user);
	
	public User checklogin(User user);
	
	public String CheckactivationCode(User user);
	
	public void activateuser(User user);
	
	public Integer checkstatusByNo(String no);
}
