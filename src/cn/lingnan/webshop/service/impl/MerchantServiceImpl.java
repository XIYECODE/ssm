package cn.lingnan.webshop.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.dao.MerchantMapper;
import cn.lingnan.webshop.domain.Merchant;
import cn.lingnan.webshop.query.MerchantQuery;
import cn.lingnan.webshop.service.MerchantService;
import cn.lingnan.webshop.service.base.impl.BaseServiceImpl;

@Service
public class MerchantServiceImpl extends BaseServiceImpl<Merchant, MerchantQuery> implements MerchantService {
	
	
	@Autowired
	public void setMerchantMapper(MerchantMapper merchantMapper) {
		this.baseMapper = merchantMapper;
	}
	
	@Autowired
	MerchantMapper mMapper;
	
	@Override
	public Merchant login(String loginName, String password) {
		return ((MerchantMapper) baseMapper).login(loginName, password);
	}

	@Override
	public Merchant findBypId(Integer pid) {
		return mMapper.findBypId(pid);
	}

	@Override
	public PageInfo<Merchant> getRegisterMerchant(MerchantQuery mQuery) {
		PageHelper.startPage(mQuery.getPageNum(), mQuery.getPageSize());							//不可缺少，否则报错
		Page<Merchant> list = (Page<Merchant>) mMapper.getRegisterMerchant(mQuery);
		return list.toPageInfo();
	}
	@Override
	public List<Merchant> getRegisterMerchantList() {
		return mMapper.getRegisterMerchant(null);
	}

	@Override
	public boolean pass(Integer mid) {
		if (mMapper.pass(mid) > 0) {
			return true;
		}
		return false;
	}
	
	
	@Override
	public boolean checkPassword(Merchant merchant) {
		if (mMapper.checkPassword(merchant) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updatePassword(Merchant merchant) {
		if (mMapper.updatePassword(merchant) > 0) {
			return true;
		}
		return false;
	}
}
