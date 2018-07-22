package cn.ttms.service;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.User;

public interface UserService {
	public List<User> queryuserByVo(QueryVo vo);
	public Integer queryuserByVoCount(QueryVo vo);
	public User queryuserByNo(String no);
	public void updateuserByNo(User user);
	public void updatePassByVo(User user);
	public void deleteuserByNo(String no);
	public void insertuser(User user);
	public void activationUser(User user);
}
