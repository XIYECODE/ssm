package cn.lingnan.webshop.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.domain.Catalog;
import cn.lingnan.webshop.domain.Product;
import cn.lingnan.webshop.service.CatalogService;
import cn.lingnan.webshop.service.ProductService;
import cn.lingnan.webshop.service.SecondCatalogService;
import cn.lingnan.webshop.utils.JsonModel;

@Controller
@RequestMapping("")
public class CatalogController {
	
	@Autowired
	CatalogService cService;
	
	@Autowired
	SecondCatalogService sService;
	
	@Autowired
	ProductService pService;
	
	
	@RequestMapping("index")
	public String Index() {
		return "index";
	}
	
	@RequestMapping(value="/catalog.do", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Catalog> getList(ModelMap modelMap) {
		JsonModel<Catalog> jModel = new JsonModel<>();
		jModel.setSuccess(true);
		jModel.setMsg("查询用户成功");
		
		PageInfo<Catalog> info = cService.getCatalog();
		
		jModel.setRows(info.getList());
		jModel.setTotal((int)info.getTotal());
		return jModel;
	}
	
	
	/**
	 * 若无required=false，当无参数时，会出现异常
	 */
	@RequestMapping(value="/getProduct.do", method=RequestMethod.POST)
	public String getProductList(@RequestParam(value="sid", required=false)Integer sid, 
			@RequestParam(value="cid", required=false)Integer cid, 
			@RequestParam(value="value", required=false)String value, 
			@RequestParam(value="searchProductContent", required=false)String searchProductContent, ModelMap map) {
		if (value != null) {
			try {
				value = new String(value.getBytes("iso-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		System.out.println("searchProductContent = "+searchProductContent);
		List<Product> pList = cService.findProduct(sid, cid, value, searchProductContent);
		map.addAttribute("products", pList);
		return "products/list";
	}
	
	
	@RequestMapping("/usrLMT")
	public String usrLMT() {
		return "common/404";
	}
	
	
	@RequestMapping("/admins/categorieslist")
	public String categories() {
		return "admins/categories/categories";
	}
	
	/**
	 * 2019-04-28
	 * @param attrid
	 * @param sid
	 * @param cid
	 * @param value
	 * @return
	 */
	@RequestMapping(value="/admins/updateCategories", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<?> updateCategories(@RequestParam(value="attrid", required=false)Integer attrid, 
			@RequestParam(value="sid", required=false)Integer sid, 
			@RequestParam(value="cid", required=false)Integer cid, 
			@RequestParam(value="value", required=false)String value) {
		JsonModel<?> jModel = new JsonModel<>();
		System.out.println("updateCategories");
		if (sService.updateCategories(cid, sid, attrid, value)) {
			jModel.setSuccess(true);
			jModel.setMsg("更新成功");
		}else {
			jModel.setSuccess(false);
			jModel.setMsg("更新失败");
		}
		
		return jModel;
	}	
/*	@RequestMapping(value="/merchants/merchant/categories/updateCategories", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<?> updateCategories(@RequestParam(value="attrid", required=false)Integer attrid, 
			@RequestParam(value="sid", required=false)Integer sid, 
			@RequestParam(value="cid", required=false)Integer cid, 
			@RequestParam(value="value", required=false)String value) {
		JsonModel<?> jModel = new JsonModel<>();
		
		if (sService.updateCategories(cid, sid, attrid, value)) {
			jModel.setSuccess(true);
			jModel.setMsg("更新成功");
		}else {
			jModel.setSuccess(false);
			jModel.setMsg("更新失败");
		}
		
		return jModel;
	}	
*/	
	
	/**
	 * 2019-04-29
	 * @param attrid
	 * @param sid
	 * @param cid
	 * @param value
	 * @return
	 */
	@RequestMapping(value="/admins/addCatalog", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Catalog> addCategories(@RequestParam(value="value", required=false)String value) {
		JsonModel<Catalog> jModel = new JsonModel<>();
		System.out.println("addCatalog");
		if (cService.addCatalog(value)) {
			jModel.setSuccess(true);
			jModel.setMsg("更新成功");
		}else {
			jModel.setSuccess(false);
			jModel.setMsg("更新失败");
		}
		PageInfo<Catalog> info = cService.getCatalog();
		
		jModel.setRows(info.getList());
		jModel.setTotal((int)info.getTotal());
		return jModel;
	}	
/*	@RequestMapping(value="/merchants/merchant/categories/addCatalog", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Catalog> addCategories(@RequestParam(value="value", required=false)String value) {
		JsonModel<Catalog> jModel = new JsonModel<>();
		
		if (cService.addCatalog(value)) {
			jModel.setSuccess(true);
			jModel.setMsg("更新成功");
		}else {
			jModel.setSuccess(false);
			jModel.setMsg("更新失败");
		}
		PageInfo<Catalog> info = cService.getCatalog();
		
		jModel.setRows(info.getList());
		jModel.setTotal((int)info.getTotal());
		return jModel;
	}	
*/	
	
	
	//----------------------------------------------------------2019-05-16-----------------------------------------------------------------
	/**
	 * 若无required=false，当无参数时，会出现异常
	 */
	@RequestMapping(value="/getProduct.do", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Product> getProduct(@RequestParam(value="cid", required=false)Integer cid,  @RequestParam(value="sid", required=false)Integer sid, ModelMap map) {
		
		JsonModel<Product> jModel = new JsonModel<>();
		jModel.setSuccess(true);
		jModel.setMsg("查询用户成功");
		
		PageInfo<Product> info = null;
		if(cid != null && sid == null)
			info = pService.getProductByCid(cid);
		else if(sid != null && cid == null)
			info = pService.getProductBySid(sid);
		
		
		jModel.setRows(info.getList());
		jModel.setTotal((int)info.getTotal());

		return jModel;
	}
	
	
	@RequestMapping(value="/search.do", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Product> searchKeyword(@RequestParam(value="cid", required=false)Integer cid,  @RequestParam(value="sid", required=false)Integer sid,  String keyword){
		JsonModel<Product> jModel = new JsonModel<>();
		System.out.println("keyword = "+keyword+cid);
		
		PageInfo<Product> info = pService.findProductByKeyword(cid, sid, keyword);
		if (info != null) {
			jModel.setSuccess(true);
			jModel.setMsg("查询成功");
			jModel.setRows(info.getList());
			jModel.setTotal((int)info.getTotal());
		}else {
			jModel.setSuccess(false);
			jModel.setMsg("查询失败");
		}
		return jModel;
	}
	
	
	@RequestMapping(value="/show/catalogs/{id}", method=RequestMethod.GET)
	public String show(@PathVariable("id") Integer id, ModelMap map) {
		System.out.println("show/id = "+id);
		map.addAttribute("cid", id);
		return "show";
	}
	
	//----------------------------------------------2019-05-23----------------------------------------------------------------
	@RequestMapping(value="/searchmore.do", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Product> searchmore(@RequestParam(value="sid", required=false) Integer sid,  
			@RequestParam(value="min-price", required=false) Double minprice,  
			@RequestParam(value="max-price", required=false) Double maxprice, String content){
		JsonModel<Product> jModel = new JsonModel<>();
		System.out.println("content = "+content);
		System.out.println("minprice = "+minprice);
		System.out.println("maxprice = "+maxprice);
		
		if (content == null) {
			return null;
		}
		if(minprice!=null && maxprice != null && minprice > maxprice) {
			System.out.println("最低价低于最高价。。。。。。。。。。。。。。。。。");
			return null;
		}
		String[] attrArray = content.split(",");
		for (int i = 0; i < attrArray.length; i++) {
			System.out.println("attrArray = "+attrArray[i]);
		}
		PageInfo<Product> info = pService.findMoreProduct(sid, minprice, maxprice, attrArray);
		if (info != null) {
			jModel.setSuccess(true);
			jModel.setMsg("查询成功");
			jModel.setRows(info.getList());
			jModel.setTotal((int)info.getTotal());
		}else {
			jModel.setSuccess(false);
			jModel.setMsg("查询失败");
		}
		return jModel;
	}
	
	//--------------------------------------------------2019-05-26--------------------------------------------------------
	@RequestMapping(value="/show/product/{id}")
	public String product(@PathVariable("id") Integer pid, ModelMap map) {
		map.addAttribute("pid", pid);
		return "product";
	}
	
	@RequestMapping(value="/show/product/{id}", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Product> product(@PathVariable("id") Integer pid){
		JsonModel<Product> jModel = new JsonModel<>();
		System.out.println("content = "+pid);
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
	
}
