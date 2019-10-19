package cn.lingnan.webshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.domain.SecondCatalog;
import cn.lingnan.webshop.service.SecondCatalogService;
import cn.lingnan.webshop.utils.JsonModel;

@Controller
@RequestMapping("")
public class SecondCatalogController {
	@Autowired
	SecondCatalogService sService;
	

	@RequestMapping(value="/secondCatalog.do", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<SecondCatalog> getSecondList(Integer cid, ModelMap map) {
		JsonModel<SecondCatalog> jModel = new JsonModel<>();
		jModel.setSuccess(true);
		jModel.setMsg("查询用户成功");
		
		PageInfo<SecondCatalog> info = sService.getSecondCatalog(cid);
		
		jModel.setRows(info.getList());
		jModel.setTotal((int)info.getTotal());
		
		
		return jModel;
	}	
	
	/**
	 * 2019-04-29
	 * @param attrid
	 * @param sid
	 * @param cid
	 * @param value
	 * @return
	 */
	@RequestMapping(value="/admins/addSecondCatalog", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<SecondCatalog> addSecondCatalog(@RequestParam(value="cid", required=false) Integer cid, @RequestParam(value="value", required=false)String value) {
		JsonModel<SecondCatalog> jModel = new JsonModel<>();
		
		if (sService.addSecondCatalog(cid, value)) {
			jModel.setSuccess(true);
			jModel.setMsg("更新成功");
		}else {
			jModel.setSuccess(false);
			jModel.setMsg("更新失败");
		}
		PageInfo<SecondCatalog> info = sService.getSecondCatalog(cid);
		
		jModel.setRows(info.getList());
		jModel.setTotal((int)info.getTotal());
		return jModel;
	}	
/*	@RequestMapping(value="/merchants/merchant/categories/addSecondCatalog", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<SecondCatalog> addSecondCatalog(@RequestParam(value="cid", required=false) Integer cid, @RequestParam(value="value", required=false)String value) {
		JsonModel<SecondCatalog> jModel = new JsonModel<>();
		
		if (sService.addSecondCatalog(cid, value)) {
			jModel.setSuccess(true);
			jModel.setMsg("更新成功");
		}else {
			jModel.setSuccess(false);
			jModel.setMsg("更新失败");
		}
		PageInfo<SecondCatalog> info = sService.getSecondCatalog(cid);
		
		jModel.setRows(info.getList());
		jModel.setTotal((int)info.getTotal());
		return jModel;
	}	
*/	
}
