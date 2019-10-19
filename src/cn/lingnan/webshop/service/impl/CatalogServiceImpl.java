package cn.lingnan.webshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.dao.CatalogMapper;
import cn.lingnan.webshop.domain.Catalog;
import cn.lingnan.webshop.domain.Product;
import cn.lingnan.webshop.service.CatalogService;

@Service
public class CatalogServiceImpl implements CatalogService {
	
	@Autowired
	CatalogMapper cMapper;
	
	public PageInfo<Catalog> getCatalog() {
		PageHelper.startPage(1, 10);							//不可缺少，否则报错
		Page<Catalog> list = (Page<Catalog>) cMapper.find();
		return list.toPageInfo();
	}
	
	public List<Product> findProduct(Integer sid, Integer cid, String value, String searchProductContent) {
		return cMapper.findProduct(sid, cid, value, searchProductContent);
	}

	@Override
	public boolean addCatalog(String value) {
		if (cMapper.add(value) > 0) {
			return true;
		}
		return false;
	}

	
}
