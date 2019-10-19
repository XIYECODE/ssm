package cn.lingnan.webshop.controller.base;

import java.lang.reflect.ParameterizedType;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.query.base.BaseQuery;
import cn.lingnan.webshop.service.base.BaseService;
import cn.lingnan.webshop.utils.EncodingUtil;
import cn.lingnan.webshop.utils.JsonModel;

public class BaseController<T, E extends BaseQuery> {
	
	
	@Autowired
	protected BaseService<T, E> baseService;
	
	
	private String prefix;
	private String simpleName;
	
	private Class<T> classObj;
	
	@SuppressWarnings("unchecked")
	public BaseController() {
		ParameterizedType parameterizedType = (ParameterizedType) this.getClass().getGenericSuperclass();	//<T,E>
		classObj = (Class<T>) parameterizedType.getActualTypeArguments()[0];					//获取参数T获取
		simpleName = classObj.getSimpleName().toLowerCase();
		prefix = simpleName + "s";
	}
	
	@RequestMapping("/centerUI")
	public String centerUI() {
		//转发到中心界面
		return prefix + "/centerUI";
	}
	
	@RequestMapping("list")
	public String listUI() {
		return prefix + "/listUI";
	}
	
	@RequestMapping(value="", headers= {"X-Requested-With=XMLHttpRequest"})
	@ResponseBody   //将返回的内容转换成json字符串[对象的属性名当做是key,对象的属性值当做是value]
	public JsonModel<T> list(E e){
		e = beforeList(e);
		JsonModel<T> jsonModel = new JsonModel<T>();
		jsonModel.setSuccess(true);
		jsonModel.setMsg("查询用户成功");
		
		PageInfo<T> pageInfo = baseService.find(e);
		
		jsonModel.setRows(pageInfo.getList());
		jsonModel.setTotal((int)pageInfo.getTotal());
 		return jsonModel;
	}
	
	public E beforeList(E e) {
		return e;
	}
	
	/**
	 * 转发到添加页面
	 * @return
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	@RequestMapping(value="/saveUI", method=RequestMethod.GET)
	public String saveUI(ModelMap modelMap,HttpServletRequest request) throws InstantiationException, IllegalAccessException {
		beforeSaveUI(modelMap,request);
		modelMap.addAttribute(simpleName, classObj.newInstance());
		return prefix + "/saveUI";
	}
	
	/**
	 * 进入保存页面之前处理
	 * @param modelMap
	 * @param request
	 */
	protected void beforeSaveUI(ModelMap modelMap,HttpServletRequest request){
		
	}
	
	/**
	 * 添加用户
	 * @param simpleName
	 * @return
	 */
	@RequestMapping(value="", method=RequestMethod.POST)
	public String save(T t) {
		baseService.add(t);
		return "redirect:/"+prefix+"/list";
	}
	
	
	/**
	 * 转发到更新页面
	 * @return
	 */
	@RequestMapping(value="/{id}/editUI", method=RequestMethod.GET)				//id是请求参数
	public String editUI(@PathVariable("id") Integer id, ModelMap modelMap) {
		T t = baseService.findById(id);
		if (t == null) {
			//id不存在 TODO
			return null;
		}else {
			modelMap.addAttribute(simpleName, t);
			return prefix + "/saveUI";
		}
	}
	
	/**
	 * 转发到更新页面
	 * @return
	 */
	@RequestMapping(value="/{id}", method=RequestMethod.PUT)				//id是请求参数
	public String edit(@PathVariable("id") Integer id, T t, ModelMap modelMap) {
		baseService.update(t);
		return "redirect:/"+prefix+"/list";
	}
	
	
	/**
	 * 删除用户
	 * @param ids
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/{ids}", headers= {"X-Requested-With=XMLHttpRequest"}, method=RequestMethod.DELETE)
	@ResponseBody   //将返回的内容转换成json字符串[对象的属性名当做是key,对象的属性值当做是value]
	public JsonModel delete(@PathVariable("ids") String ids){
		JsonModel jsonModel = new JsonModel();
		if (EncodingUtil.isEmpty(ids)) {
			jsonModel.setSuccess(false);
			jsonModel.setMsg("删除失败！");
			return jsonModel;
		}
		
		String[] idArray = ids.split(",");
		int count = baseService.deleteByIds(idArray);
		if (count != 0) {
			jsonModel.setSuccess(true);
			jsonModel.setMsg("删除成功！");
		}
 		return jsonModel;
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/{ids}", headers= {"X-Requested-With=XMLHttpRequest"}, method=RequestMethod.PUT)
	@ResponseBody
	public JsonModel forbid(@PathVariable("ids") String ids, Integer status, ModelMap modelMap) {
		
		JsonModel jsonModel = new JsonModel();
		if (EncodingUtil.isEmpty(ids)) {
			jsonModel.setSuccess(false);
			jsonModel.setMsg("删除失败！");
			return jsonModel;
		}
		
		String[] idArray = ids.split(",");
		if (baseService.updateStatus(status, idArray)) {
			jsonModel.setSuccess(true);
			jsonModel.setMsg("删除成功！");
		}
 		return jsonModel;
	}
}
