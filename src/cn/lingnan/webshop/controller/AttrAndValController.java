package cn.lingnan.webshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.domain.AttrAndVal;
import cn.lingnan.webshop.service.AttrAndValService;
import cn.lingnan.webshop.utils.JsonModel;

@Controller
@RequestMapping("")
public class AttrAndValController {
	
	@Autowired
	AttrAndValService aService;

	@RequestMapping(value="/secondValue.do", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<AttrAndVal> getSecondValueList(Integer sid, ModelMap map) {
		JsonModel<AttrAndVal> jModel = new JsonModel<>();
		jModel.setSuccess(true);
		jModel.setMsg("查询成功");
		
		PageInfo<AttrAndVal> info = aService.getSecondValue(sid);
		
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
	@RequestMapping(value="/merchants/merchant/categories/addSecondValue", headers={"X-Requested-With=XMLHttpRequest"})
	@ResponseBody
	public JsonModel<AttrAndVal> addSecondValue(@RequestParam(value="sid", required=false) Integer sid, @RequestParam(value="value", required=false)String value) {
		JsonModel<AttrAndVal> jModel = new JsonModel<>();
		
		if (aService.addSecondValue(sid, value)) {
			jModel.setSuccess(true);
			jModel.setMsg("更新成功");
		}else {
			jModel.setSuccess(false);
			jModel.setMsg("更新失败");
		}
		PageInfo<AttrAndVal> info = aService.getSecondValue(sid);
		
		jModel.setRows(info.getList());
		jModel.setTotal((int)info.getTotal());
		return jModel;
	}	
	
	
}
