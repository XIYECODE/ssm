package cn.lingnan.webshop.query;

import cn.lingnan.webshop.query.base.BaseQuery;

public class OrderItemQuery extends BaseQuery {
	private String id;
	private Integer pid;
	private Integer sid;
	private Integer status;
	private Integer mid;
	private String sortName;
	private String sortOrder;

	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getSortName() {
		return sortName;
	}
	public void setSortName(String sortName) {
		this.sortName = sortName;
	}
	public String getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return "OrderItemQuery [id=" + id + ", pid=" + pid + ", sid=" + sid + ", status=" + status + ", mid=" + mid
				+ ", sortName=" + sortName + ", sortOrder=" + sortOrder + "]";
	}
}
