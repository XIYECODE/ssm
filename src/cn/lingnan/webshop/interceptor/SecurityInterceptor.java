package cn.lingnan.webshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.lingnan.webshop.utils.ConstantUtil;

public class SecurityInterceptor implements HandlerInterceptor {

	//mvc
	   //拦截器
	        //第一实现接口
	        //第二配置
	
	/**
	 * 进入到控制之前执行
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		Object sessionData = request.getSession().getAttribute(ConstantUtil.SESSION_KEY);
		if (sessionData == null) {
			response.sendRedirect(request.getContextPath()+"/loginUI");/*重定向"/users/loginUI"*/
			return false;
		}else{
			if(request.getRequestURI().indexOf("users/user/") != -1) {
				System.out.println("user -----------------------------"+request.getRequestURI());
				/*用户中心*/
				if ("0".equals(request.getSession().getAttribute("ROLE_ID"))) {
					return true;
				}else {
					response.sendRedirect(request.getContextPath()+"/usrLMT");
					return false;
				}
			}else if(request.getRequestURI().indexOf("merchants/merchant/") != -1) {
				/*商家中心*/
				if ("1".equals(request.getSession().getAttribute("ROLE_ID"))) {
					return true;
				}else {
					response.sendRedirect(request.getContextPath()+"/usrLMT");
					return false;
				}
			}else if(!"2".equals(request.getSession().getAttribute("ROLE_ID"))) {
				response.sendRedirect(request.getContextPath()+"/index");
				return false;
			}
		}
		System.out.println("/admins/-================="+request.getRequestURI());
		return true;
	}

	
	//以下两个暂时用不到
	/**
	 * 调用了控制器但是还没有返回view
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}
	
	/**
	 * 返回view之后,一般用来释放资源
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}
}