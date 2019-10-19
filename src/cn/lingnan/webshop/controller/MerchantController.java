package cn.lingnan.webshop.controller;


import java.io.File;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.controller.base.BaseController;
import cn.lingnan.webshop.domain.AttrAndVal;
import cn.lingnan.webshop.domain.Merchant;
import cn.lingnan.webshop.domain.OrderItem;
import cn.lingnan.webshop.domain.Product;
import cn.lingnan.webshop.domain.User;
import cn.lingnan.webshop.query.MerchantQuery;
import cn.lingnan.webshop.query.OrderItemQuery;
import cn.lingnan.webshop.query.ProductQuery;
import cn.lingnan.webshop.service.AttrAndValService;
import cn.lingnan.webshop.service.MerchantService;
import cn.lingnan.webshop.service.OrderItemService;
import cn.lingnan.webshop.service.ProductService;
import cn.lingnan.webshop.service.SecondCatalogService;
import cn.lingnan.webshop.service.UserService;
import cn.lingnan.webshop.utils.ConstantUtil;
import cn.lingnan.webshop.utils.JsonModel;


@Controller							//bean
@RequestMapping("/merchants")
public class MerchantController extends BaseController<Merchant, MerchantQuery> {
	@Autowired
	public void setMerchantService(MerchantService merchantService) {
		this.baseService = merchantService;
	}
	
	@Autowired
	ProductService productService;
	
	@Autowired
	AttrAndValService aService;
	
	@Autowired
	SecondCatalogService sService;
	
	@Autowired
	OrderItemService oService;
	
	@Autowired
	UserService uService;
	
	@Autowired
	MerchantService mService;
	
	@Override
	public MerchantQuery beforeList(MerchantQuery e) {
		//System.out.println("name="+e.getName());
		//System.out.println("loginname="+e.getLoginName());
		return e;
	}
	
	@RequestMapping("/merchant/management")
	public String management() {
		return "merchants/merchant/management";
	}
	
	/*=====================20190425=========================================*/
	
	@RequestMapping("/merchant/products/{status}/list")
	public String products_list(@PathVariable("status") Integer status, ModelMap map) {
		map.addAttribute("status", status);
		return "merchants/merchant/products/listUI";
	}
	

	/**
	 * 获取商品信息并跳转编辑页面
	 */
	@RequestMapping(value="/merchant/products/{id}/editUI", method=RequestMethod.GET)				//id是请求参数
	public String editUI(@PathVariable("id") Integer id, ModelMap modelMap) {
		Product product = productService.findById(id);
		if (product == null) {
			return null;
		}else {
			//处理当前商品扩展属性
			     //============================20190509================================
			     //根据商品id获取
			if(productService.findByProductId(product.getCkid(), product.getId()) != null) {
				product = productService.findByProductId(product.getCkid(), product.getId());
				     //
				/*List<AttrAndVal> ls = product.getAttribute();
				for(int i=0; i<ls.size(); i++) {
					System.out.println("ls.get(i).getValue().length() = "+ls.get(i).getValue());
					if (ls.get(i).getValue() == null) {
						//System.out.println("ls.get(i).getValue()4 = "+ls.get(i).getValue());
						ls.remove(ls.get(i));
					}
				}
				System.out.println(ls);*/
				System.out.println(product);
			}
			
			modelMap.addAttribute("secondcatalog", JSON.toJSONString(product.getAttribute()));
			//
			modelMap.addAttribute("product", product);
			return "merchants/merchant/products/saveUI";
		}
	}
	
	/**
	 * 更新商品信息
	 * @param sidAndVals
	 * @param id
	 * @param product
	 * @param file
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/merchant/products/{id}", method=RequestMethod.POST/*PUT*/)				//id是请求参数
	public String edit(@RequestParam(value="sidAndVals", required=false) String sidAndVals, @PathVariable("id") Integer id, Product product, MultipartFile file, HttpServletRequest request, ModelMap modelMap) throws Exception {
		System.out.println("UpdatesidAndVals = "+sidAndVals);
		if (!file.isEmpty()) {
			String localpath = saveImagePath(request);
			//删除原来照片
			String oldImg = localpath.substring(0, localpath.indexOf("images"))+product.getImage();
			//System.out.println("oldImg = "+oldImg);
			File f = new File(oldImg);
			if (f.exists()) {
				System.out.println(f.getCanonicalPath());
				f.delete();
			}
			//更新图片
			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			String contentType=file.getContentType();
			String suffixName=contentType.substring(contentType.indexOf("/")+1);
			String filename=uuid+"."+suffixName;
			file.transferTo(new File(localpath+filename));
			product.setImage("images/"+filename);
		}
		productService.update(product);
		//=============================更新扩展属性===============================
		if (sidAndVals != null || "".equals(sidAndVals)) {
			String[] sidAndVal = sidAndVals.split("-");
			List<AttrAndVal> lsUpd = new ArrayList<>();
			List<AttrAndVal> lsAdd = new ArrayList<>();
			List<AttrAndVal> lsDel = aService.findByProductId(product.getId());
			for(int i=0; i<sidAndVal.length; i++) {
				String[] str = sidAndVal[i].split(":");
				AttrAndVal val = new AttrAndVal();
				val.setSkid(Integer.parseInt(str[0]));
				val.setValue(str[1]);
				val.setPkid(product.getId());
				
				AttrAndVal oAttrAndVal = aService.check(Integer.parseInt(str[0]), product.getId());
				if (oAttrAndVal != null) {
					lsUpd.add(val);																					//已存在属性直接更新
					if(lsDel.contains(oAttrAndVal)) {															//删除更改未选属性，需要在实体重写equals
						lsDel.remove(oAttrAndVal);
					}
				}else {																									//添加商品时没有添加当前属性，插入
					lsAdd.add(val);
				}
			}
			//不执行删除，将已有属性更改为未选属性后，将其内容置空
			for(int i=0; i<lsDel.size(); i++) {
				AttrAndVal val = lsDel.get(i);
				val.setValue(null);
				lsUpd.add(val);
			}
			//
			System.out.println("lsAddfff = "+lsAdd+"\nlsUpdffff = "+lsUpd+"\nlsDelfffff = "+lsDel);
			if (!lsAdd.isEmpty()) {
				aService.add(lsAdd);
			}
			if (!lsUpd.isEmpty()) {
				aService.update(lsUpd);
			}
			System.out.println("how to do");
			if (!lsDel.isEmpty()) {
				//aService.delete(lsDel);
			}
		}
		return "redirect:/merchants/merchant/products/0/list";
	}
	
	/*=========================2019-04-28=======================================*/
	/**
	 * 目录显示页面
	 * @return
	 */
	@RequestMapping("/merchant/categories/list")
	public String categories() {
		return "merchants/merchant/categories/categories";
	}
	
	
	/*=========================2019-05-01=====================================*/
	/**
	 * 一个欢迎页面
	 * @return
	 */
	@RequestMapping(value="/merchant/welcome")
	public String welcome() {
		return "common/welcome";
	}
	
	/**
	 * 获取个人信息
	 * @param modelMap
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/merchant/info")
	public String info(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("merchant",(Merchant)session.getAttribute(ConstantUtil.SESSION_KEY));
		return "merchants/merchant/info";
	}
	
	/**.
	 * 更新个人信息
	 * @param id
	 * @param t
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/merchant/{id}", method=RequestMethod.PUT)				//id是请求参数
	public String update(@PathVariable("id") Integer id, Merchant t, ModelMap modelMap, HttpSession session) {
		baseService.update(t);
		session.setAttribute(ConstantUtil.SESSION_KEY, baseService.findById(id));
		return "merchants/merchant/info";
	}

	//-------------------------------------------------------------2019-06-20----------------------------------------------------
	/**
	 * 商家修改密码页
	 * @return
	 */
	@RequestMapping(value="/merchant/changePassword")
	public String changePassword() {
		return "merchants/merchant/changePassword";
	}
	
	/**
	 * 商家修改密码
	 * @param password
	 * @param status
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/merchant/changePassword", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<User> check(@Param("password") String password, @Param("status") String status, HttpSession session){
		Merchant user = (Merchant) session.getAttribute(ConstantUtil.SESSION_KEY);

		System.out.println("oItemQuery = "+password);

		JsonModel<User> jModel = new JsonModel<>();
		if (user != null) {
			user.setPassword(password);
			if ("check".equals(status)) {
				jModel.setSuccess(mService.checkPassword(user));
			}else if ("update".equals(status)) {
				jModel.setSuccess(mService.updatePassword(user));
			}
		}
		
		return jModel;
	}
	
	
	/**
	 * 商品添加页面
	 * @return
	 */
	@RequestMapping(value="/merchant/products/add")				//id是请求参数
	public String add() {
		return "merchants/merchant/products/addProduct";
	}
	
	/**
	 * 添加商品、上传图片
	 * @param product
	 * @param file
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/merchant/products/uploadPic", method=RequestMethod.POST)
	public String upload(@RequestParam(value="sidAndVals", required=false) String sidAndVals, Product product, MultipartFile file, HttpServletRequest request, Model model) throws Exception{ 
		String sqlPath = "";   //定义文件保存的本地路径 
		System.out.println("product.getCkid() = "+product.getCkid());
        System.out.println(System.getProperty("user.dir")+"/"+(MerchantController.class.getPackage().getName()).replaceAll("//.", "/")+"/");
		String filename=null;    
		//=============================添加商品===========================
		if(!file.isEmpty()){ 
			//获取项目在服务器绝对路径和项目名
			String realPath = request.getSession().getServletContext().getRealPath("/");
			String[] webNames = realPath.split("\\\\");
			String webName = webNames[webNames.length-1];
			//图片保存路径
			String localpath = System.getProperty("user.dir").substring(0, System.getProperty("user.dir").indexOf("eclipse"))+webName+"\\WebContent\\static\\images\\";
			//String webpath = realPath + "\\WebContent\\images\\";
			//生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			//获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType=file.getContentType();
			//获得文件后缀名
			String suffixName=contentType.substring(contentType.indexOf("/")+1);
			//得到 文件名
			filename=uuid+"."+suffixName;
			//文件保存路径
			file.transferTo(new File(localpath+filename));
			//file.transferTo(new File(webpath+filename));
			//把图片的相对路径保存至数据库
			sqlPath = "images/"+filename;
		} 
		//System.out.println("sqlPath = "+sqlPath); 
		//user.setId(1); 
		product.setImage(sqlPath);
		//
		Merchant merchant = (Merchant) request.getSession().getAttribute(ConstantUtil.SESSION_KEY);
		product.setMid(merchant.getId());
		product.setMerchantname(merchant.getStoreName());
		product.setIsPassed(0);
		product.setRegisterTime(new SimpleDateFormat ("yyyy-MM-dd").format(new Date( )));

		productService.addProduct(product);
		
		//=============================更新扩展属性===========================
		//
		if (sidAndVals != null || "".equals(sidAndVals)) {
			String[] sidAndVal = sidAndVals.split("-");
			List<AttrAndVal> ls = new ArrayList<>();
			
			for(int i=0; i<sidAndVal.length; i++) {
				String[] str = sidAndVal[i].split(":");
				AttrAndVal val = new AttrAndVal();
				val.setSkid(Integer.parseInt(str[0]));
				val.setValue(str[1]);
				val.setPkid(product.getId());
				
				ls.add(val);
			}
			
			aService.add(ls);
		}
		
		model.addAttribute("product", product);
		return "redirect:/merchants/merchant/products/0/list";
	}
	
	/**
	 * 获得工程名
	 * @param request
	 * @return
	 */
	public String getWebName(HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/");
		String[] webNames = realPath.split("\\\\");
		String webName = webNames[webNames.length-1];
		return webName;
	}
	
	/**
	 * 获得图片保存绝对路径
	 * @param request
	 * @return
	 */
	public String saveImagePath(HttpServletRequest request) {
		String webName = getWebName(request);
		String localpath = System.getProperty("user.dir").substring(0, System.getProperty("user.dir").indexOf("eclipse"))+webName+"\\WebContent\\static\\images\\";
		return localpath;
	}
	
	/*===========================2019-06-10==================================*/
	/**
	 * 缺货页面
	 * @return
	 */
	@RequestMapping(value="/merchant/products/shortProducts")
	public String shortProducts() {
		System.out.println("shortProducts");
		return "merchants/merchant/products/shortProducts";
	}
	/**
	 * 获取缺货商品信息
	 * @param product
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/merchant/products/getShortProducts", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Product> getShortProducts(ProductQuery product, HttpSession session){
		Merchant merchant = (Merchant) session.getAttribute(ConstantUtil.SESSION_KEY);
		System.out.println("ProductQuery = "+product);
		JsonModel<Product> jModel = new JsonModel<>();
		if (merchant != null) {
			
			product.setMid(merchant.getId());
			product.setQuantity(0);
			PageInfo<Product> pageInfo = productService.getShortProducts(product);
			jModel.setSuccess(true);
			jModel.setMsg("获取缺货信息成功");
			jModel.setRows(pageInfo.getList());
			jModel.setTotal((int)pageInfo.getTotal());
		}
		System.out.println("end shirtPoduct");
		return jModel;
	}
	/**
	 * 获取所有商品信息
	 * @param product
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/merchant/products/getProducts", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Product> getProducts(ProductQuery product, HttpSession session){
		Merchant merchant = (Merchant) session.getAttribute(ConstantUtil.SESSION_KEY);
		System.out.println("ProductQuery = "+product);
		JsonModel<Product> jModel = new JsonModel<>();
		if (merchant != null) {
			
			product.setMid(merchant.getId());
			PageInfo<Product> pageInfo = productService.getShortProducts(product);
			jModel.setSuccess(true);
			jModel.setMsg("获取缺货信息成功");
			jModel.setRows(pageInfo.getList());
			jModel.setTotal((int)pageInfo.getTotal());
		}
		System.out.println("end shirtPoduct");
		return jModel;
	}
	
	/*-----------------------------------------------------订单管理----------------------------------------------------*/
	/**
	 * 商家订单页面
	 * @param status
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/merchant/orderItems/list/{status}")
	public String orderItems_list(@PathVariable("status") Integer status, ModelMap map) {
		map.addAttribute("status", status);
		return "merchants/merchant/orderItems/listUI";
	}
	//==================================2019-06-11============================
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
			Product product = productService.findById(pid);
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
	@RequestMapping(value="/merchant/orderItems/list", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Map<String, Object>> list(OrderItemQuery oItemQuery, HttpSession session){
		Merchant merchant = (Merchant) session.getAttribute(ConstantUtil.SESSION_KEY);
		System.out.println("oItemQuery = "+oItemQuery);
		JsonModel<Map<String, Object>> jModel = new JsonModel<>();
		if (merchant != null) {
			oItemQuery.setMid(merchant.getId());
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
	
	
	@RequestMapping(value="/merchant/orderItems/orderItems.do", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<Map<String, Object>> doOrderItem(@Param("ids") String ids, @Param("status")Integer status, HttpSession session){
		Merchant merchant = (Merchant) session.getAttribute(ConstantUtil.SESSION_KEY);
		System.out.println("status = "+status);
		System.out.println("ids = "+ids);
		JsonModel<Map<String, Object>> jModel = new JsonModel<>();
		if (merchant != null && ids!=null && status != null) {
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
			oItemQuery.setMid(merchant.getId());
			oItemQuery.setStatus(status-1);
			PageInfo<OrderItem> pageInfo = oService.list(oItemQuery);
			
			List<OrderItem> oList = pageInfo.getList();

			jModel.setRows(generalEntity(oList));
			jModel.setTotal((int)pageInfo.getTotal());
		}
		System.out.println("end orderItems/doOrderItem");
		return jModel;
	}
	
	
	
	
	
}
