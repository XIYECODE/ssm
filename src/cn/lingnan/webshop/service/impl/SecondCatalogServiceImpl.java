package cn.lingnan.webshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.dao.SecondCatalogMapper;
import cn.lingnan.webshop.domain.SecondCatalog;
import cn.lingnan.webshop.service.SecondCatalogService;

@Service
public class SecondCatalogServiceImpl implements SecondCatalogService {
	
	@Autowired
	SecondCatalogMapper sMapper;

	@Override
	public PageInfo<SecondCatalog> getSecondCatalog(Integer id) {
		PageHelper.startPage(1, 10);							//不可缺少，否则报错
		Page<SecondCatalog> list = (Page<SecondCatalog>) sMapper.findById(id);
		return list.toPageInfo();
	}

	/**
	 * 2019-04-28
	 */
	@Override
	public boolean updateCategories(Integer cid, Integer sid, Integer attrid, String value) {
		if (sMapper.updateCategories(cid, sid, attrid, value) > 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean addSecondCatalog(Integer cid, String value) {
		if (sMapper.addSecondCatalog(cid, value) > 0){
			return true;
		}
		return false;
	}
	
}
