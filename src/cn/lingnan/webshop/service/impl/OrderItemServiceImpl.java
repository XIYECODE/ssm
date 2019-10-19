package cn.lingnan.webshop.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.dao.OrderItemMapper;
import cn.lingnan.webshop.domain.OrderItem;
import cn.lingnan.webshop.query.OrderItemQuery;
import cn.lingnan.webshop.service.OrderItemService;
import cn.lingnan.webshop.service.base.impl.BaseServiceImpl;

@Service
public class OrderItemServiceImpl extends BaseServiceImpl<OrderItem, OrderItemQuery> implements OrderItemService {
	
	
	@Autowired
	public void setUserMapper(OrderItemMapper orderItemMapper) {
		this.baseMapper = orderItemMapper;
	}
	
	@Autowired
	OrderItemMapper oMapper;

	@Override
	public OrderItem find(Integer pid, Integer sid) {
		/*return oMapper.find(pid, sid);*/
		return null;
	}

	@Override
	public boolean update(OrderItem orderItem, String oldId) {
		
		if (oMapper.update(orderItem, oldId) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean addOrderItem(OrderItem orderItem) {
		if (oMapper.addOrderItem(orderItem) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<OrderItem> getCart(Integer sid) {
		return oMapper.getCart(sid);
	}

	@Override
	public OrderItem find(Integer pid, Integer sid, Integer status) {
		return oMapper.find(pid, sid, status);
	}

	@Override
	public boolean deleteByPids(String... strings) {
		if (oMapper.deleteByPids(strings) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteByids(List<String[]> ids) {
		if (oMapper.deleteByids(ids) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<OrderItem> findAll(Integer sid, Integer status) {
		return oMapper.findAll(sid, status);
	}

	@Override
	public PageInfo<OrderItem> list(OrderItemQuery oItemQuery) {
		PageHelper.startPage(oItemQuery.getPageNum(), oItemQuery.getPageSize());/*设置第一页，每一页显示一条记录*/
		Page<OrderItem> list = (Page<OrderItem>) oMapper.list(oItemQuery);
		return list.toPageInfo();
	}

	@Override
	public boolean updateStatus(List<OrderItemQuery> list, Integer status) {
		if (oMapper.updateStatus(list, status) > 0) {
			return true;
		}
		return false;
	}
	
}
