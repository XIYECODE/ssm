package cn.lingnan.webshop.controller;


import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.controller.base.BaseController;
import cn.lingnan.webshop.domain.OrderItem;
import cn.lingnan.webshop.domain.Product;
import cn.lingnan.webshop.domain.User;
import cn.lingnan.webshop.query.OrderItemQuery;
import cn.lingnan.webshop.query.UserQuery;
import cn.lingnan.webshop.service.OrderItemService;
import cn.lingnan.webshop.service.ProductService;
import cn.lingnan.webshop.service.UserService;
import cn.lingnan.webshop.utils.ConstantUtil;
import cn.lingnan.webshop.utils.JsonModel;


@Controller							//bean
@RequestMapping("/users")
public class UserController extends BaseController<User, UserQuery> {
	@Autowired
	public void setUserService(UserService userService) {
		this.baseService = userService;
	}

	@Autowired
	ProductService pService;
	
	@Autowired
	OrderItemService oService;
	
	@Autowired
	UserService uService;
	
	@RequestMapping("/user/management")
	public String management() {
		return "users/user/management";
	}
	
	@RequestMapping("/user/welcome")
	public String welcome() {
		//转发到登录界面
		return "common/welcome";/*WEB-INF/jsp/loginUI.jsp*/
	}
	
	@RequestMapping(value="/user/info")
	public String info(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("user",(User)session.getAttribute(ConstantUtil.SESSION_KEY));
		return "users/user/info";
	}
	
	@RequestMapping(value="/user/{id}")
	public String info(@PathVariable("id") Integer	 id, User user, HttpSession session) {
		baseService.update(user);
		session.setAttribute(ConstantUtil.SESSION_KEY, baseService.findById(id));
		return "users/user/info";
	}
	
	/**
	 * 用户修改密码页
	 * @return
	 */
	@RequestMapping(value="/user/changePassword")
	public String changePassword() {
		return "users/user/changePassword";
	}
	/**
	 * 用户修改密码
	 * @param password
	 * @param status
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/user/changePassword", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<User> check(@Param("password") String password, @Param("status") String status, HttpSession session){
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);

		System.out.println("oItemQuery = "+password);

		JsonModel<User> jModel = new JsonModel<>();
		if (user != null) {
			user.setPassword(password);
			if ("check".equals(status)) {
				jModel.setSuccess(uService.checkPassword(user));
			}else if ("update".equals(status)) {
				jModel.setSuccess(uService.updatePassword(user));
			}
		}
		
		return jModel;
	}
	
	
	/*---------------------------------------------------------订单管理-------------------------------------------------------*/
	//==================================2019-06-18============================
	
	@RequestMapping(value="/user/orderItems/list/{status}")
	public String list(@PathVariable("status") Integer status, ModelMap map) {
		map.addAttribute("status", status);
		return "users/user/orderItems/listUI";
	}
	
	/**
	 * 模拟生成新的订单实体类
	 * @param oList
	 * @return
	 */
	public List<Map<String, Object>> generalEntity(List<OrderItem> oList){
		List<Map<String, Object>> rows = new ArrayList<>();
		
		for(int i=0; i<oList.size(); i++) {
			
			Integer pid = oList.get(i).getPid();
			Integer sid = oList.get(i).getSid();
			Product product = pService.findById(pid);
			User user = uService.findById(sid);
			
			Map<String, Object> map = new HashMap<>();
			map.put("pname", product.getName());
			map.put("username", user.getLoginName());
			
			OrderItem orderItem = oList.get(i);
			@SuppressWarnings("rawtypes")
			Class oClass = orderItem.getClass();
			Field[] fields = oClass.getDeclaredFields();
			for(int k=0; k<fields.length; k++) {
				try {
					fields[k].setAccessible(true);									// 设置属性可以访问
					// 获取实体类的属性及其属性值
					String key = fields[k].getName();
					Object value = fields[k].get(orderItem);
					//System.out.println(k+"、"+fields[k].getName()+" = "+fields[k].get(orderItem));
					map.put(key, value);
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
			// 类似生成一个临时实体类
			rows.add(map);
		}
		return rows;
	}
	
	/**
	 * 获取订单信息
	 * @param oItemQuery
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/user/orderItems/list", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Map<String, Object>> list(OrderItemQuery oItemQuery, HttpSession session){
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		System.out.println("oItemQuery = "+oItemQuery);
		JsonModel<Map<String, Object>> jModel = new JsonModel<>();
		if (user != null) {
			oItemQuery.setSid(user.getId());
			PageInfo<OrderItem> pageInfo = oService.list(oItemQuery);
			jModel.setSuccess(true);
			jModel.setMsg("获取订单信息成功");
			
			List<OrderItem> oList = pageInfo.getList();
			
			jModel.setRows(generalEntity(oList));
			jModel.setTotal((int)pageInfo.getTotal());
		}
		System.out.println("end orderItems/list");
		return jModel;
	}
	
	
	@RequestMapping(value="/user/orderItems/orderItems.do", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Map<String, Object>> doOrderItem(@Param("ids") String ids, @Param("status")Integer status, HttpSession session){
		User user = (User) session.getAttribute(ConstantUtil.SESSION_KEY);
		System.out.println("status = "+status);
		System.out.println("ids = "+ids);
		JsonModel<Map<String, Object>> jModel = new JsonModel<>();
		if (user != null && ids!=null && status != null) {
			List<OrderItemQuery> list = new ArrayList<>();
			// 处理数据
			String[] idStrings = ids.split(",");
			for(int i=0; i<idStrings.length; i++) {
				System.out.println(idStrings[i]);
				
				String[]  id = idStrings[i].split("-");
				OrderItemQuery query = new OrderItemQuery();
				query.setId(id[0]);
				query.setPid(Integer.parseInt(id[1]));
				query.setSid(Integer.parseInt(id[2]));
				
				list.add(query);
			}
			
			// 更新操作
			if (oService.updateStatus(list, status)) {
				jModel.setSuccess(true);
				jModel.setMsg("更新操作成功");
			}
			
			// 重新获取数据
			OrderItemQuery oItemQuery = new OrderItemQuery();
			oItemQuery.setSid(user.getId());
			oItemQuery.setStatus(status-1);
			PageInfo<OrderItem> pageInfo = oService.list(oItemQuery);
			
			List<OrderItem> oList = pageInfo.getList();

			jModel.setRows(generalEntity(oList));
			jModel.setTotal((int)pageInfo.getTotal());
		}
		System.out.println("end orderItems/doOrderItem");
		return jModel;
	}
	
	
	@RequestMapping(value="/user/tip")
	public String tip() {
		return "users/user/tip";
	}
}
