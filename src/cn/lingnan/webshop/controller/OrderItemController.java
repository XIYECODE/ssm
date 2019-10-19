package cn.lingnan.webshop.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.lingnan.webshop.controller.base.BaseController;
import cn.lingnan.webshop.domain.Merchant;
import cn.lingnan.webshop.domain.OrderItem;
import cn.lingnan.webshop.domain.Product;
import cn.lingnan.webshop.domain.User;
import cn.lingnan.webshop.query.OrderItemQuery;
import cn.lingnan.webshop.service.MerchantService;
import cn.lingnan.webshop.service.OrderItemService;
import cn.lingnan.webshop.service.ProductService;
import cn.lingnan.webshop.utils.ConstantUtil;
import cn.lingnan.webshop.utils.EncodingUtil;
import cn.lingnan.webshop.utils.JsonModel;


@Controller							//bean
@RequestMapping("/users/user/orderItems")
public class OrderItemController extends BaseController<OrderItem, OrderItemQuery> {
	@Autowired
	public void setUserService(OrderItemService orderItemService) {
		this.baseService =orderItemService;
	}
	
	@Autowired
	OrderItemService oService;
	
	@Autowired
	ProductService pService;
	
	@Autowired
	MerchantService mService;
	
	
	//-----------------------------------------------------2019-05-027--------------------------------------------------
	
	/**
	 * 2019-05-27
	 * 新增或更新订单项（购物车）
	 * @param pid
	 * @param quantity
	 * @param session
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/checkInfo.do", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<OrderItem> checkInfoAdd(@RequestParam(value="pid", required=false)Integer pid, 
			@RequestParam(value="quantity", required=false)Integer quantity, 
			HttpSession session, ModelMap map) {
		System.out.println("/users/user/orderItems/checkInfo.do");
		
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		System.out.println("code = "+pid);
		System.out.println("code = "+quantity);
		System.out.println("code = "+user);
		JsonModel<OrderItem> jModel = new JsonModel<>();
		
		if (user == null) {
			jModel.setSuccess(false);
		}else {
			jModel.setSuccess(true);
			Product product = pService.findById(pid);
			//先查询是否有该订单项
			OrderItem orderItem = oService.find(pid, user.getId(), 0);
			if (orderItem == null) {							//没有则添加
				OrderItem newItem = new OrderItem();
				newItem.setPid(pid);
				newItem.setSid(user.getId());
				newItem.setPrice(product.getDiscount());
				newItem.setQuantity(quantity);
				newItem.setStatus(0);
				
				String id = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				System.out.println("datetime string format = "+id);
				newItem.setId(id);
				
				//
				if(oService.addOrderItem(newItem)) {
					jModel.setMsg("添加成功");
					map.addAttribute("addsuccess", 1);
				}else {
					jModel.setMsg("添加失败");
					map.addAttribute("addsuccess", 0);
				}
			}else {													//有则更新
				//更新需要保留旧的id，即为旧时间戳
				String oldId = orderItem.getId();
				//更新数据
				orderItem.setId(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));

				orderItem.setPrice(product.getDiscount());
				orderItem.setQuantity(quantity);
				System.out.println("oService = 1");
				if(oService.update(orderItem, oldId)) {
					jModel.setMsg("更新成功");
					map.addAttribute("updatesuccess", 1);
				}else {
					jModel.setMsg("更新失败");
					map.addAttribute("updatesuccess", 0);
				}
				System.out.println("oService = 1");
			}
		}
		
		return jModel;
	}
	
	/*@RequestMapping(value="/confirmOrder/{pids}", method=RequestMethod.GET)
	public String confirmOrder(@PathVariable("pids")String pids, HttpSession session, ModelMap map) {
		map.addAttribute("pids", pids);
		System.out.println("pids = "+pids);
		//修改状态位，使之为1.
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		if (user == null) {
			return "redirect:/loginUI";
		}
		if (pids != null) {
			String[] pidArr = pids.split(",");
			for(int i=0; i<pidArr.length; i++) {
				Integer pid = Integer.parseInt(pidArr[i]);
				OrderItem orderItem = oService.find(pid, user.getId(), 0);
				if (orderItem != null) {
					//更新需要保留旧的id，即为旧时间戳
					String oldId = orderItem.getId();
					//更新数据
					orderItem.setId(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
					orderItem.setStatus(1);
					oService.update(orderItem, oldId);
				}
			}
		}
		return "users/user/orderItems/confirmOrder";
	}*/
	@RequestMapping(value="/confirmOrder", method=RequestMethod.GET)
	public String confirmOrder(@Param("pids")String pids, HttpSession session, ModelMap map) {
		System.out.println("pids = "+pids);
		//修改状态位，使之为1.
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		if (user == null) {
			return "redirect:/loginUI";
		}
		if (pids != null) {				// 当前操作的订单
			String[] pidArr = pids.split(",");
			for(int i=0; i<pidArr.length; i++) {
				Integer pid = Integer.parseInt(pidArr[i]);
				Product product = pService.findById(pid);
				OrderItem orderItem = oService.find(pid, user.getId(), 0);
				if (orderItem != null) {
					//更新需要保留旧的id，即为旧时间戳
					String oldId = orderItem.getId();
					//更新数据
					orderItem.setId(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
					orderItem.setStatus(1);
					orderItem.setPrice(product.getDiscount());
					oService.update(orderItem, oldId);
				}
			}
		}
		/*else {						// 当前用户所有未提交订单
			pids = "";
			List<OrderItem> ls = oService.findAll(user.getId(), 1);
			for(OrderItem orderItem : ls) {
				pids += orderItem.getPid()+",";
			}
		}*/
		map.addAttribute("pids", pids);
		return "users/user/orderItems/confirmOrder";
	}
	
	/**
	 * 获取购买商品信息
	 * @param pids
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/buildOrderItem", headers= {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<List<?>> buildOrderItem(@Param("pids") String pids, HttpSession session){
		JsonModel<List<?>> jModel = new JsonModel<>();
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		if (EncodingUtil.isEmpty(pids)) {
			jModel.setSuccess(false);
			jModel.setMsg("参数错误");
		}else {
			String[] pidArray = pids.split(",");
			List<OrderItem> lOrderItems = new ArrayList<>();
			List<Product> list1 = new ArrayList<>();
			List<Merchant> list2 = new ArrayList<>();
			for(int i=0; i<pidArray.length; i++) {
				//获取OrderItem
				lOrderItems.add(oService.find(Integer.parseInt(pidArray[i]), user.getId(), 1));
				//获取图片路径
				list1.add(pService.findById(Integer.parseInt(pidArray[i])));
				//获取商店名
				list2.add(mService.findBypId(Integer.parseInt(pidArray[i])));
			}
			List<List<?>> rows = new ArrayList<>();
			rows.add(lOrderItems);
			rows.add(list1);
			rows.add(list2);
			jModel.setRows(rows);
			jModel.setSuccess(true);
			jModel.setMsg("加载成功");
		}
		
		return jModel;
	}
	
	/**
	 * 2019-05-27
	 * 新增订单
	 * @param name
	 * @param address
	 * @param telephone
	 * @param pid
	 * @param quantity
	 * @param session
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/buildOrderItem.do")
	public String buildOrderItem(@RequestParam(value="recipientName", required=false)String name, 
			@RequestParam(value="recipientAddress", required=false)String address, 
			@RequestParam(value="recipientTelephone", required=false)String telephone, 
			@RequestParam(value="pid", required=false)Integer pid, 
			@RequestParam(value="quantity", required=false)Integer quantity, 
			HttpSession session, ModelMap map) {
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		
		System.out.println("pid = "+pid);
		System.out.println("quantity = "+quantity);
		
		if (user == null) {
			return "redirect:/loginUI";
		}
		//先查询是否有该订单项
		OrderItem orderItem = oService.find(pid, user.getId(), 0);
		Product product = pService.findById(pid);
		if (orderItem == null) {							//没有则添加
			OrderItem newItem = new OrderItem();
			newItem.setPid(pid);
			newItem.setSid(user.getId());
			newItem.setPrice(product.getDiscount());
			newItem.setQuantity(quantity);
			newItem.setStatus(0);
			
			String id = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			System.out.println("datetime string format = "+id);
			newItem.setId(id);
			
			//
			if(oService.addOrderItem(newItem)) {
				map.addAttribute("addsuccess", 1);
			}else {
				map.addAttribute("addsuccess", 0);
			}
		}else {													//有则更新
			//更新需要保留旧的id，即为旧时间戳
			String oldId = orderItem.getId();
			//更新数据
			orderItem.setId(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
			orderItem.setPrice(product.getDiscount());
			orderItem.setQuantity(quantity);
			orderItem.setName(name);
			orderItem.setAddress(address);
			orderItem.setTelephone(telephone);
			orderItem.setStatus(1);
			
			if(oService.update(orderItem, oldId)) {
				map.addAttribute("updatesuccess", 1);
			}else {
				map.addAttribute("updatesuccess", 0);
			}
		}
		return "users/user/orderItems/confirmOrder";
	}
	
	
	/*===============================2019-06-03==================================*/
	/**
	 * 购物车
	 * @return
	 */
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String cart() {
		return "users/user/orderItems/cart";
	}
	
	/**
	 * 获取购物车数据
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/buildCart", headers= {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<List<?>> cart(HttpSession session){
		JsonModel<List<?>> jModel = new JsonModel<>();
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		if (user == null) {
			jModel.setSuccess(false);
			jModel.setMsg("参数错误");
		}else {
			List<OrderItem> lOrderItems = new ArrayList<>();
			List<Product> list1 = new ArrayList<>();
			List<Merchant> list2 = new ArrayList<>();
			
			
			List<OrderItem> cart = oService.getCart(user.getId());
			for(int i=0; i<cart.size(); i++) {
				//获取OrderItem
				lOrderItems.add(cart.get(i));
				//获取图片路径
				list1.add(pService.findById(cart.get(i).getPid()));
				//获取商店名
				list2.add(mService.findBypId(cart.get(i).getPid()));
			}
			List<List<?>> rows = new ArrayList<>();
			rows.add(lOrderItems);
			rows.add(list1);
			rows.add(list2);
			jModel.setRows(rows);
			jModel.setSuccess(true);
			jModel.setMsg("加载成功");
		}
		
		return jModel;
	}
	
	/**
	 * 处理购物车购买数据
	 * @param value
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/cart/{value}")
	public String buyBySelect(@PathVariable("value")String value, HttpSession session) {
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		if (user == null) {
			return "redirect:/loginUI";
		}
		//获取最新数据
		System.out.println("value = "+value);
		String[] pids = value.split("=")[0].split(",");
		String[] quantities = value.split("=")[1].split(",");
		boolean flag = true;
		for (int i = 0; i < pids.length; i++) {
			OrderItem orderItem = oService.find(Integer.parseInt(pids[i]), user.getId(), 0);
			Product product = pService.findById(Integer.parseInt(pids[i]));
			if (orderItem != null) {
				orderItem.setPrice(product.getDiscount());
				orderItem.setQuantity(Integer.parseInt(quantities[i]));
				if (!oService.update(orderItem, orderItem.getId())) {
					flag = false;
				}
			}
		}
		if (flag) {
			//重定向
			return "redirect:/users/user/orderItems/confirmOrder?pids="+value.split("=")[0];
		}else {
			return "redirect:/usrLMT";
		}
	}
	
	/**
	 * 删除购物车商品
	 * @param pids
	 * @param session
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/cart/delete.do", headers= {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel deleteCart(@Param("pids")String pids, HttpSession session) {
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		JsonModel jModel = new JsonModel();
		if (EncodingUtil.isEmpty(pids)) {
			jModel.setSuccess(false);
			jModel.setMsg("删除失败！");
			return jModel;
		}
		
		String[] pidArray = pids.split(",");
		String[] idArray = new String[pidArray.length];
		for (int i = 0; i < idArray.length; i++) {
			OrderItem orderItem = oService.find(Integer.parseInt(pidArray[i]), user.getId(), 0);
			if (orderItem != null ) {
				idArray[i] = orderItem.getId(); 
			}
		}
		for (String string : idArray) {
			System.out.print(string+"\t");
		}
		if (oService.deleteByPids(idArray)) {
			jModel.setSuccess(true);
			jModel.setMsg("删除成功！");
		}
		return jModel;
	}
	
	//=====================2019-06-06================================
	/**
	 * 提交订单
	 * @param pids
	 * @param name
	 * @param address
	 * @param telephone
	 * @param session
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/submitOrder.do", headers= {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel submitOrder(@Param("pids")String pids, 
			@RequestParam(value="recipientName", required=false)String name, 
			@RequestParam(value="recipientAddress", required=false)String address, 
			@RequestParam(value="recipientTelephone", required=false)String telephone, HttpSession session) {
		System.out.println("submitOrder pids = "+pids);
		JsonModel jModel = new JsonModel();
		//修改状态位，使之为2.
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		int flag = 0;
		if (user != null && pids != null) {
			String[] pidArr = pids.split(",");
			System.out.println("length = "+pidArr.length);
			String orderItemId = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			for(int i=0; i<pidArr.length; i++) {
				Integer pid = Integer.parseInt(pidArr[i]);
				OrderItem orderItem = oService.find(pid, user.getId(), 1);
				if (orderItem != null) {
					//更新需要保留旧的id，即为旧时间戳
					String oldId = orderItem.getId();
					//更新数据
					orderItem.setId(orderItemId+i);
					orderItem.setStatus(2);
					orderItem.setName(name);
					orderItem.setAddress(address);
					orderItem.setTelephone(telephone);
					if (oService.update(orderItem, oldId)) {
						//减少商品数量
						Product product = pService.findByProductId(null, pid);
						System.out.println("product = "+product);
						product.setQuantity(product.getQuantity()-orderItem.getQuantity());
						pService.update(product);
						flag++;
					}
				}
			}
			if (flag < pidArr.length) {
				jModel.setSuccess(false);
				if (flag == 0) {
					jModel.setMsg("所有订单提交失败");
				}else {
					jModel.setMsg("部分订单提交失败");
				}
			}else {
				jModel.setSuccess(true);
				jModel.setMsg("所有订单提交完成");
			}
		}
		return jModel;
	}
	
	/**
	 * 删除未提交订单商品
	 * @param pids
	 * @param session
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/confirmOrder/delete.do", headers= {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel deleteOrder(@Param("pids")String pids, HttpSession session) {
		System.out.println("confirmOrder/delete.do");
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		JsonModel jModel = new JsonModel();
		if (EncodingUtil.isEmpty(pids)) {
			jModel.setSuccess(false);
			jModel.setMsg("删除失败！");
			return jModel;
		}
		System.out.println("id = "+pids);
		String[] pidArr = pids.split(",");
		/*Integer[] idArray = new Integer[pidArr.length];
		Integer[] pidArray = new  Integer[pidArr.length];
		Integer[] sidArray = new  Integer[pidArr.length];*/
		List<String[]> ids = new ArrayList<>();
		for (int i = 0; i < pidArr.length; i++) {
			OrderItem orderItem = oService.find(Integer.parseInt(pidArr[i]), user.getId(), 1);
			if (orderItem != null ) {
				String[] id = new String[3];
				id[0] = orderItem.getId(); 
				id[1] =  String.valueOf(pidArr[i]);
				id[2] =  String.valueOf(user.getId());
				ids.add(id);
			}
		}
		if (oService.deleteByids(ids)) {
			jModel.setSuccess(true);
			jModel.setMsg("删除成功！");
		}

		System.out.println("confirmOrder/delete.do/end");
		return jModel;
	}
	
}
