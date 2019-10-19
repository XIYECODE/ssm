package cn.lingnan.webshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.domain.Merchant;
import cn.lingnan.webshop.query.MerchantQuery;
import cn.lingnan.webshop.service.base.BaseService;

public interface MerchantService extends BaseService<Merchant,MerchantQuery> {
	Merchant login(String loginName, String password);
	Merchant findBypId(Integer pid);
	
	PageInfo<Merchant> getRegisterMerchant(MerchantQuery mQuery);
	List<Merchant> getRegisterMerchantList();
	boolean pass(Integer mid);
	
	
	
	boolean checkPassword(Merchant merchant);
	boolean updatePassword(Merchant merchant);
}
