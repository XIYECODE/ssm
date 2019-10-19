package cn.lingnan.webshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.lingnan.webshop.utils.ConstantUtil;

public class LoginInterceptor implements HandlerInterceptor {

	//mvc
	   //拦截器
	        //第一实现接口
	        //第二配置
	
	/**
	 * 进入到控制之前执行
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		//System.out.println("LoginInterceptor");
		// false不放行，true放行
		System.out.println("===================1=======================");
		System.out.println(request.getRequestURI());
		Object sessionData = request.getSession().getAttribute(ConstantUtil.SESSION_KEY);
		System.err.println("sessionData = "+sessionData);
		if (sessionData == null) {/*未登录，自动转到登陆界面*/
			if (!request.getRequestURI().startsWith(request.getContextPath()+"/login")) {
				response.sendRedirect(request.getContextPath()+"/loginUI");/*重定向"/users/loginUI"*/
				return false;
			}
		}else {/*已经登录过了*/
			if (request.getRequestURI().startsWith(request.getContextPath()+"/login")) {
				/*输入登录界面地址直接去到index*/
				System.out.println("request.getAttribute(\"ROLE_ID\") = "+request.getSession().getAttribute("ROLE_ID"));
				// 根据登陆角色定位主页面 TODO
				if ("2".equals(request.getSession().getAttribute("ROLE_ID"))) {
					response.sendRedirect(request.getContextPath()+"/admins/management");
				}else if ("1".equals(request.getSession().getAttribute("ROLE_ID"))) {
					response.sendRedirect(request.getContextPath()+"/merchants/merchant/management");
				}else if ("0".equals(request.getSession().getAttribute("ROLE_ID"))) {
					response.sendRedirect(request.getContextPath()+"/index");
				}
			}
		}
		return true;
	}

	
	//以下两个暂时用不到
	/**
	 * 调用了控制器但是还没有返回view
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		System.out.println("===================2=======================");
	}
	
	/**
	 * 返回view之后,一般用来释放资源
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

		System.out.println("===================3=======================");
	}
}