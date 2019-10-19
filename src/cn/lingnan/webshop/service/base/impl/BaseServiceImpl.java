package cn.lingnan.webshop.service.base.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.dao.base.BaseMapper;
import cn.lingnan.webshop.domain.base.BaseDomain;
import cn.lingnan.webshop.query.base.BaseQuery;
import cn.lingnan.webshop.service.base.BaseService;
import cn.lingnan.webshop.utils.Sys;

public class BaseServiceImpl<T, E extends BaseQuery> implements BaseService<T, E> {
	
	protected BaseMapper<T, E> baseMapper;
	
	@Autowired
	protected Sys sys;
	
	@Override
	public PageInfo<T> find(E e) {
		System.out.println(e.getPageNum()+"------===============------"+e.getPageSize());
		PageHelper.startPage(e.getPageNum(), e.getPageSize());/*设置第一页，每一页显示一条记录*/
		Page<T> list = (Page<T>)baseMapper.find(e);
		return list.toPageInfo();
	}

	@Override
	public T findById(Integer id) {
		return (T) baseMapper.findById(id);
	}

	@Override
	public int add(T t) {
		((BaseDomain) t).setPassword(sys.getDefaultPassword());
		return  baseMapper.add(t);
	}

	@Override
	public int update(T t) {
		return baseMapper.update(t);
	}

	@Override
	public int deleteByIds(String... idArray) {
		return baseMapper.deleteByIds(idArray);
	}

	@Override
	public boolean updateStatus(Integer status, String... array) {
		if (baseMapper.updateStatus(status, array) > 0) {
			return true;
		}
		return false;
	}
}
