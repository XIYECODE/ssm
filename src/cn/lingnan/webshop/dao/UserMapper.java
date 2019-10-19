package cn.lingnan.webshop.dao;

import org.apache.ibatis.annotations.Param;

import cn.lingnan.webshop.dao.base.BaseMapper;
import cn.lingnan.webshop.domain.User;
import cn.lingnan.webshop.query.UserQuery;

public interface UserMapper extends BaseMapper<User, UserQuery> {

	User login(@Param("loginName")String loginName, @Param("password")String password);

	int checkPassword(User user);
	int updatePassword(User user);
	
	int checkUser(User user);
}
