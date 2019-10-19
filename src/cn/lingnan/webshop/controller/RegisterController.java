package cn.lingnan.webshop.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.lingnan.webshop.domain.Merchant;
import cn.lingnan.webshop.domain.User;
import cn.lingnan.webshop.service.AdminService;
import cn.lingnan.webshop.service.MerchantService;
import cn.lingnan.webshop.service.UserService;


@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	UserService uService;
	
	@Autowired
	MerchantService mService;
	
	@Autowired
	AdminService aService;
	
	//*****************************************************************注册*********************************************************
	@RequestMapping("/register")
	public String registerUI() {
		//转发到登录界面
		return "register";/*WEB-INF/jsp/loginUI.jsp*/
	}

	/*-----------------------------------------------------------------商家-------------------------------------------------------*/
	//*****************************************************************注册*********************************************************
	@RequestMapping("/mRegister")
	public String mRegisterUI() {
		//转发到登录界面
		return "mRegister";/*WEB-INF/jsp/loginUI.jsp*/
	}
	
	@RequestMapping(value="/mRegister/register.do", method=RequestMethod.POST)
	public String register(Merchant merchant, MultipartFile file, HttpServletRequest request, Model model) throws Exception{ 
		String sqlPath = "";   //定义文件保存的本地路径 
		String filename=null;  
		System.out.println("Register merchant = "+merchant);
		
		if(!file.isEmpty()){ 
			//获取项目在服务器绝对路径和项目名
			String realPath = request.getSession().getServletContext().getRealPath("/");
			String[] webNames = realPath.split("\\\\");
			String webName = webNames[webNames.length-1];
			//图片保存路径
			String localpath = System.getProperty("user.dir").substring(0, System.getProperty("user.dir").indexOf("eclipse"))+webName+"\\WebContent\\static\\images\\business\\";

			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			//获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType=file.getContentType();
			//获得文件后缀名
			String suffixName=contentType.substring(contentType.indexOf("/")+1);
			
			filename=uuid+"."+suffixName;
			file.transferTo(new File(localpath+filename));
			sqlPath = "images/business/"+filename;
		} 
		merchant.setBusinessPhoto(sqlPath);
		merchant.setDel_status(0);
		merchant.setRegisterTime(new SimpleDateFormat ("yyyy-MM-dd").format(new Date( )));
		
		mService.add(merchant);
		return "redirect:/loginUI";
	}
	

	/*-----------------------------------------------------------------用户-------------------------------------------------------*/
	//*****************************************************************注册*********************************************************
	@RequestMapping("/uRegister")
	public String uRegisterUI() {
		//转发到注册界面
		return "uRegister";
	}
	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/uRegister/register.do", method=RequestMethod.POST)
	public String register(User user) {  
		System.out.println("Register user = "+user);
		System.out.println("Register user = "+user.getSex());
		uService.add(user);
		return "redirect:/loginUI";	
	}
	/**
	 * 检查用户名是否存在
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/loginName/check.do", headers= {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public String checkLoginName(User user) {
		System.out.println("loginName/check.do = "+user);
		boolean flag = uService.checkUser(user);
		System.err.println(flag);
		if (flag) {
			return "true";
		};
		return "false";
	}
}
