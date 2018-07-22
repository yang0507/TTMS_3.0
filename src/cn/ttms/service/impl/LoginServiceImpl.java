package cn.ttms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ttms.dao.LoginMapper;
import cn.ttms.pojo.User;
import cn.ttms.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper loginMapper;
	
	@Override
	public Integer checkStatus(User user) {
		Integer status = loginMapper.checkStatus(user);
		return status;
	}

	@Override
	public Integer checktype(User user) {
		Integer type = loginMapper.checktype(user);
		return type;
	}

	@Override
	public User checklogin(User user) {
		User login = loginMapper.checklogin(user);
		return login;
	}

	@Override
	public String CheckactivationCode(User user) {
		String code = loginMapper.CheckactivationCode(user);
		return code;
	}

	@Override
	public void activateuser(User user) {
		loginMapper.activateuser(user);
	}

	@Override
	public Integer checkstatusByNo(String no) {
		Integer status = loginMapper.checkstatusByNo(no);
		return status;
	}

}
