package cn.lingnan.webshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.domain.OrderItem;
import cn.lingnan.webshop.query.OrderItemQuery;
import cn.lingnan.webshop.service.base.BaseService;

public interface OrderItemService extends BaseService<OrderItem, OrderItemQuery> {
	
	OrderItem find(Integer pid, Integer sid);
	OrderItem find(Integer pid, Integer sid, Integer status);
	List<OrderItem> findAll(Integer sid, Integer status);
	boolean addOrderItem(OrderItem orderItem);
	boolean update(OrderItem orderItem, String oldId);
	
	List<OrderItem> getCart(Integer sid);
	
	boolean deleteByPids(String ...strings);
	boolean deleteByids(List<String[]> ids);
	
	PageInfo<OrderItem> list(OrderItemQuery oItemQuery);
	
	boolean updateStatus(List<OrderItemQuery> list, Integer status);
}
