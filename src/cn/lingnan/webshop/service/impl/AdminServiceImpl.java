package cn.lingnan.webshop.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lingnan.webshop.dao.AdminMapper;
import cn.lingnan.webshop.domain.Admin;
import cn.lingnan.webshop.query.AdminQuery;
import cn.lingnan.webshop.service.AdminService;
import cn.lingnan.webshop.service.base.impl.BaseServiceImpl;

@Service
public class AdminServiceImpl extends BaseServiceImpl<Admin, AdminQuery> implements AdminService {
	
	
	@Autowired
	public void setAdminMapper(AdminMapper adminMapper) {
		this.baseMapper = adminMapper;
	}
	
	@Override
	public Admin login(String loginName, String password) {
		return ((AdminMapper) baseMapper).login(loginName, password);
	}
	
}
