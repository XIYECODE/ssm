package cn.lingnan.webshop.service.base;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.query.base.BaseQuery;

public interface BaseService<T,E extends BaseQuery> {
	PageInfo<T> find(E e);
	T findById(Integer id);
	int add(T t);
	int update(T t);
	int deleteByIds(String ... idArray);
	
	boolean updateStatus(Integer status, String ... array);
}
