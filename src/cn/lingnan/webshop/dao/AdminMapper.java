package cn.lingnan.webshop.dao;

import org.apache.ibatis.annotations.Param;

import cn.lingnan.webshop.dao.base.BaseMapper;
import cn.lingnan.webshop.domain.Admin;
import cn.lingnan.webshop.query.AdminQuery;

public interface AdminMapper extends BaseMapper<Admin, AdminQuery> {

	Admin login(@Param("loginName")String loginName, @Param("password")String password);

}
