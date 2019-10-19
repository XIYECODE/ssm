package cn.lingnan.webshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.domain.AttrAndVal;

public interface AttrAndValService {

	PageInfo<AttrAndVal> getSecondValue(Integer id);
	boolean addSecondValue(Integer sid, String value);
	boolean add(List<AttrAndVal> ls);
	boolean update(List<AttrAndVal> ls);
	boolean delete(List<AttrAndVal> ls);
	AttrAndVal check(Integer skid, Integer pkid);
	List<AttrAndVal> findByProductId(Integer pid);
	/*List<AttrAndVal> findByCatalogId(Integer ckid);*/
}
