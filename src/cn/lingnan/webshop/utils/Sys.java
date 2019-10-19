package cn.lingnan.webshop.utils;

import org.springframework.beans.factory.annotation.Value;

public class Sys {
	
	
	@Value(value="${defaultPassword}")
	private String defaultPassword;
	
	@Value(value="${pageSize}")
	private int pageSize;
	
	public String getDefaultPassword() {
		return defaultPassword;
	}
	public void setDefaultPassword(String defaultPassword) {
		this.defaultPassword = defaultPassword;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
