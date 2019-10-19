package cn.lingnan.webshop.service;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.domain.SecondCatalog;

public interface SecondCatalogService {
	PageInfo<SecondCatalog> getSecondCatalog(Integer id);
	boolean updateCategories(Integer cid, Integer sid, Integer attrid, String value);
	boolean addSecondCatalog(Integer cid, String value);
}
