package cn.lingnan.webshop.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.lingnan.webshop.service.AdminService;
import cn.lingnan.webshop.service.MerchantService;
import cn.lingnan.webshop.service.UserService;
import cn.lingnan.webshop.utils.ConstantUtil;


@Controller
@RequestMapping("/loginUI")
public class LoginController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	MerchantService merchantService;
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("")
	public String loginUI() {
		//转发到登录界面
		return "loginUI";/*WEB-INF/jsp/loginUI.jsp*/
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(String loginName, String password, String loginId, HttpSession session, ModelMap map) {
		/*形参的名字必须和前端页面的name属性一致。否则会匹配不到*/
		Object object = null;
		String url = "/loginUI";
		String lgURL = "";
		if ("0".equals(loginId)) {
			object = userService.login(loginName, password);
			lgURL = "/index";
		}else if ("1".equals(loginId)) {
			object = merchantService.login(loginName, password);
			lgURL = "/merchants/merchant/management";
		}else if ("2".equals(loginId)) {
			object = adminService.login(loginName, password);
			lgURL = "/admins/management";
		}
		if (object != null) {
			session.setAttribute(ConstantUtil.SESSION_KEY, object);
			session.setAttribute("ROLE_ID", loginId);							//用于登陆用户定位对应页面
			url = lgURL;
		}
		/*	默认转发，省略forward:，地址栏不变。转发刷新页面会执行上次结果，例如插入一条数据，刷新后会插入同一条数据，容易导致异常*/		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/loginOut")
	public String loginOut(HttpSession session) {
		session.removeAttribute(ConstantUtil.SESSION_KEY);
		return "loginUI";
	}
	
	
}
