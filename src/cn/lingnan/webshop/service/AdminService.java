package cn.lingnan.webshop.service;

import cn.lingnan.webshop.domain.Admin;
import cn.lingnan.webshop.query.AdminQuery;
import cn.lingnan.webshop.service.base.BaseService;

public interface AdminService extends BaseService<Admin,AdminQuery> {
	Admin login(String loginName, String password);
}
