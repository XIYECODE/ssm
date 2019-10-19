package cn.lingnan.webshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.lingnan.webshop.dao.base.BaseMapper;
import cn.lingnan.webshop.domain.OrderItem;
import cn.lingnan.webshop.query.OrderItemQuery;

public interface OrderItemMapper extends BaseMapper< OrderItem,  OrderItemQuery> {

	/*OrderItem find(@Param("pid") Integer pid, @Param("sid") Integer sid);*/
	OrderItem find(@Param("pid") Integer pid, @Param("sid") Integer sid, @Param("status") Integer status);
	List<OrderItem> findAll(@Param("sid") Integer sid, @Param("status") Integer status);
	int addOrderItem(OrderItem orderItem);
	int update(@Param("orderItem") OrderItem orderItem, @Param("oldId") String oldId);

	List<OrderItem> getCart(@Param("sid") Integer sid);
	
	int deleteByPids(@Param("ids")String ...strings);
	int deleteByids(@Param("ids")List<String[]> ids);
	
	List<OrderItem> list(OrderItemQuery orderItemQuery );
	
	int updateStatus(@Param("list")List<OrderItemQuery> list, @Param("status")Integer status);
}
