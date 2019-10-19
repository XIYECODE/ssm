package cn.lingnan.webshop.service;

import cn.lingnan.webshop.domain.User;
import cn.lingnan.webshop.query.UserQuery;
import cn.lingnan.webshop.service.base.BaseService;

public interface UserService extends BaseService<User,UserQuery> {
	User login(String loginName, String password);
	
	boolean checkPassword(User user);
	boolean updatePassword(User user);
	
	boolean checkUser(User user);
}
