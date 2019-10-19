package cn.lingnan.webshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.lingnan.webshop.dao.base.BaseMapper;
import cn.lingnan.webshop.domain.Merchant;
import cn.lingnan.webshop.query.MerchantQuery;

public interface MerchantMapper extends BaseMapper<Merchant, MerchantQuery> {

	Merchant login(@Param("loginName")String loginName, @Param("password")String password);
	Merchant findBypId(@Param("pid") Integer pid);
	
	List<Merchant> getRegisterMerchant(MerchantQuery mQuery);
	int pass(@Param("id") Integer mid);
	
	int updatePassword(Merchant merchant);
	int checkPassword(Merchant merchant);
	
}
