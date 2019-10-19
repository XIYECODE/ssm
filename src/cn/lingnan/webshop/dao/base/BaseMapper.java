package cn.lingnan.webshop.dao.base;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.lingnan.webshop.query.base.BaseQuery;

public interface BaseMapper<T, E extends BaseQuery> {
	List<T> find(E e);/*MerchantMapper---->MerchantMapper.xml*/
	T findById(Integer id);
	int add(T t);
	int update(T t);
	int deleteByIds(String ... idArray);
	

	int updateStatus( @Param("status")Integer status, @Param("array")String ... array);
}
