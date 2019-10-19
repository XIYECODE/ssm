package cn.lingnan.webshop.controller;


import java.util.ArrayList;
import java.util.List;

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
import cn.lingnan.webshop.domain.Admin;
import cn.lingnan.webshop.domain.Merchant;
import cn.lingnan.webshop.domain.Product;
import cn.lingnan.webshop.query.AdminQuery;
import cn.lingnan.webshop.query.MerchantQuery;
import cn.lingnan.webshop.query.ProductQuery;
import cn.lingnan.webshop.service.AdminService;
import cn.lingnan.webshop.service.MerchantService;
import cn.lingnan.webshop.service.ProductService;
import cn.lingnan.webshop.utils.ConstantUtil;
import cn.lingnan.webshop.utils.JsonModel;


@Controller							//bean
@RequestMapping("/admins")
public class AdminController extends BaseController<Admin, AdminQuery> {
	@Autowired
	public void setAdminService(AdminService adminService) {
		this.baseService = adminService;
	}
	
	@Autowired
	ProductService pService;
	
	@Autowired
	MerchantService mService;
	
	
	@RequestMapping("management")
	public String management() {
		return "admins/management";
	}
	
	@RequestMapping("welcome")
	public String welcome() {
		return "common/welcome";
	}
	
	@RequestMapping(value="info")
	public String Info(HttpSession session, ModelMap map) {
		map.addAttribute("admin", session.getAttribute(ConstantUtil.SESSION_KEY));
		return "admins/info";
	}
	
	@RequestMapping(value="{id}/update")
	public String updateInfo(@PathVariable("id") Integer id, Admin admin, HttpSession session) {
		baseService.update(admin);
		session.setAttribute(ConstantUtil.SESSION_KEY, baseService.findById(id));
		return "admins/info";
	}
	
	/*-------------------------------------------------------商家管理---------------------------------------------------------*/
	//*******************************************************商品****************************************************************
	//================================20190617==================================
	/**
	 * 20190617
	 * 待审核商品页面
	 * @return
	 */
	@RequestMapping(value="/products/unPass")
	public String unPass() {
		return "admins/products/unPass";
	}
	
	/**
	 * 20190617
	 * 获取待审核商品列表
	 * @return
	 */
	@RequestMapping(value="/products/unPass/list", headers= {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Product> list(ProductQuery pQuery){
		System.out.println("/products/unPass/list");
		System.out.println(pQuery);
		
		JsonModel<Product> jModel = new JsonModel<>();
		PageInfo<Product> pageInfo = pService.getUnPassProducts(pQuery);
		jModel.setSuccess(true);
		jModel.setMsg("获取缺货信息成功");
		jModel.setRows(pageInfo.getList());
		jModel.setTotal((int)pageInfo.getTotal());
		
		return jModel;
	}
	/**
	 * 20190617
	 * 获取待审核商品列表
	 * @return
	 */
	@RequestMapping(value="/products/unPass/getList", headers= {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Product> getList(){
		System.out.println("/products/unPass/list");
		
		JsonModel<Product> jModel = new JsonModel<>();
		List<Product> list = pService.getUnPassList();
		jModel.setSuccess(true);
		jModel.setMsg("获取缺货信息成功");
		jModel.setRows(list);
		jModel.setTotal(list.size());
		
		return jModel;
	}
	
	/**
	 * 20190617
	 * 更多属性页面
	 * @param pid
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/products/unPass/{id}")
	public String unPass(@PathVariable("id") Integer pid, ModelMap map) {
		map.addAttribute("pid", pid);
		return "admins/products/attribute";
	}
	/**
	 * 请求某商品的关联属性
	 * @param pid
	 * @return
	 */
	@RequestMapping(value="/products/unPass/{id}", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Product> unPass(@PathVariable("id") Integer pid){
		JsonModel<Product> jModel = new JsonModel<>();
		System.out.println("/products/unPass/id = "+pid);
		List<Product> pList = new ArrayList<>();
		Product product = pService.findByProductId(null, pid);
		if (product != null) {
			pList.add(product);
			jModel.setSuccess(true);
			jModel.setMsg("查询成功");
			jModel.setRows(pList);
			jModel.setTotal(1);
		}else {
			jModel.setSuccess(false);
			jModel.setMsg("查询失败");
		}
		return jModel;
	}
	
	@RequestMapping(value="/products/unPass/pass.do")
	public String pass(@Param("pid") Integer pid) {
		System.out.println("pass.do,pid = "+pid);
		if (pService.pass(pid)) {
			System.out.println("成功");
		}
		return "redirect:/admins/products/unPass";
	}
	
	//*******************************************************商家*************************************************************
	/**
	 * 20190617
	 * 待审核商家页面
	 * @return
	 */
	@RequestMapping(value="/merchants/unPass")
	public String unPass_merchant() {
		return "admins/merchants/unPass";
	}
	
	@RequestMapping(value="/merchants/{status}")
	public String merchant_status(@PathVariable("status") Integer status, ModelMap map) {
		map.addAttribute("status", status);
		return "admins/merchants/listUI";
	}
	
	/**
	 * 20190617
	 * 获取待审核商家列表-分页	
	 * @return
	 */
	@RequestMapping(value="/merchants/unPass/list", headers= {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Merchant> list(MerchantQuery mQuery){
		System.out.println("/merchants/unPass/list");
		System.out.println(mQuery);
		
		JsonModel<Merchant> jModel = new JsonModel<>();
		PageInfo<Merchant> pageInfo = mService.getRegisterMerchant(mQuery);
		
		jModel.setSuccess(true);
		jModel.setMsg("获取缺货信息成功");
		jModel.setRows(pageInfo.getList());
		jModel.setTotal((int)pageInfo.getTotal());
		
		return jModel;
	}
	/**
	 * 20190617
	 * 获取待审核商家列表
	 * @return
	 */
	@RequestMapping(value="/merchants/unPass/getList", headers= {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Merchant> getList_merchant(){
		System.out.println("/merchants/unPass/getList_merchant");
		
		JsonModel<Merchant> jModel = new JsonModel<>();
		List<Merchant> list = mService.getRegisterMerchantList();
		jModel.setSuccess(true);
		jModel.setMsg("获取待审核商家成功");
		jModel.setRows(list);
		jModel.setTotal(list.size());
		
		return jModel;
	}
	
	/**
	 * 20190617
	 * 更多属性页面
	 * @param pid
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/merchants/unPass/{id}")
	public String unPass_merchant(@PathVariable("id") Integer mid, ModelMap map) {
		map.addAttribute("mid", mid);
		return "admins/merchants/attribute";
	}
	/**
	 * 请求某商品的关联属性
	 * @param pid
	 * @return
	 */
	@RequestMapping(value="/merchants/unPass/{id}", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Merchant> unPassunPass_merchant(@PathVariable("id") Integer mid){
		JsonModel<Merchant> jModel = new JsonModel<>();
		System.out.println("/merchants/unPass/id = "+mid);
		
		List<Merchant> pList = new ArrayList<>();
		Merchant merchant = mService.findById(mid);
		if (merchant != null) {
			pList.add(merchant);
			jModel.setSuccess(true);
			jModel.setMsg("查询成功");
			jModel.setRows(pList);
			jModel.setTotal(1);
		}else {
			jModel.setSuccess(false);
			jModel.setMsg("查询失败");
		}
		return jModel;
	}
	
	@RequestMapping(value="/merchants/unPass/pass.do")
	public String pass_merchant(@Param("mid") Integer mid) {
		System.out.println("pass.do,pid = "+mid);
		
		if (mService.pass(mid)) {
			System.out.println("成功");
		}
		return "redirect:/admins/merchants/unPass";
	}
}
