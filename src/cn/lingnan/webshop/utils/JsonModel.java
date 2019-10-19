package cn.lingnan.webshop.utils;

import java.util.List;

public class JsonModel<T> {
	
	private boolean success;		//
	private List<T> rows;			//存放数据
	private String msg;				//提示信息
	private int total;					//总记录数
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
