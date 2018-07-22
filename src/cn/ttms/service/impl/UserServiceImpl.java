package cn.ttms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ttms.dao.UserMapper;
import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.User;
import cn.ttms.service.UserService;


@Service
public class UserServiceImpl implements UserService {

	@Autowired UserMapper userMapper;
	
	@Override
	public List<User> queryuserByVo(QueryVo vo) {
		List<User> list = userMapper.queryuserByVo(vo);
		return list;
	}

	@Override
	public Integer queryuserByVoCount(QueryVo vo) {
		Integer count = userMapper.queryuserByVoCount(vo);
		return count;
	}

	@Override
	public User queryuserByNo(String no) {
		User user = userMapper.queryuserByNo(no);
		return user;
	}

	@Override
	public void updateuserByNo(User user) {
		userMapper.updateuserByNo(user);
	}

	@Override
	public void updatePassByVo(User user) {
		userMapper.updatePassByVo(user);
	}

	@Override
	public void deleteuserByNo(String no) {
		userMapper.deleteuserByNo(no);
	}

	@Override
	public void insertuser(User user) {
		userMapper.insertuser(user);
	}

	@Override
	public void activationUser(User user) {
		userMapper.activationUser(user);
	}

}
