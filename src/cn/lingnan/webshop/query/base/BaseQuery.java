package cn.lingnan.webshop.query.base;

import cn.lingnan.webshop.utils.EncodingUtil;

public class BaseQuery {
	private String loginName;			//登录名
	private String name;						//实名
	private Integer pageNum=1;		//分页数
	private Integer pageSize = 10;		//每页记录条数
	
	
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = EncodingUtil.convertEncoding(loginName);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = EncodingUtil.convertEncoding(name);
	}
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
}
