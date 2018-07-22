package cn.ttms.dao;

import java.util.List;

import cn.ttms.pojo.QueryVo;
import cn.ttms.pojo.User;

public interface UserMapper {
	List<User> queryuserByVo(QueryVo vo);
	Integer queryuserByVoCount(QueryVo vo);
	User queryuserByNo(String no);
	void updateuserByNo(User user);
	void updatePassByVo(User user);
	void deleteuserByNo(String no);
	void insertuser(User user);
	void activationUser(User user);
}
