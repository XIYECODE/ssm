package cn.lingnan.webshop.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lingnan.webshop.dao.UserMapper;
import cn.lingnan.webshop.domain.User;
import cn.lingnan.webshop.query.UserQuery;
import cn.lingnan.webshop.service.UserService;
import cn.lingnan.webshop.service.base.impl.BaseServiceImpl;

@Service
public class UserServiceImpl extends BaseServiceImpl<User, UserQuery> implements UserService {
	
	
	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.baseMapper = userMapper;
	}
	
	@Autowired
	UserMapper uMapper;
	
	@Override
	public User login(String loginName, String password) {
		return ((UserMapper) baseMapper).login(loginName, password);
	}

	@Override
	public boolean checkPassword(User user) {
		if (uMapper.checkPassword(user) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updatePassword(User user) {
		if (uMapper.updatePassword(user) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean checkUser(User user) {
		if (uMapper.checkUser(user) > 0) {
			return true;
		}
		return false;
	}
	
}
