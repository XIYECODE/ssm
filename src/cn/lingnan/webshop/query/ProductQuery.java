package cn.lingnan.webshop.query;

import cn.lingnan.webshop.query.base.BaseQuery;
import cn.lingnan.webshop.utils.EncodingUtil;

public class ProductQuery extends BaseQuery {
	private String merchantname;
	private String sortName;
	private String sortOrder;
	private Integer mid;
	private Integer quantity;
	private Integer isPassed;
	private String registerTime;
	public String getMerchantname() {
		return merchantname;
	}
	public void setMerchantname(String merchantname) {
		this.merchantname = EncodingUtil.convertEncoding(merchantname);
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
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public Integer getIsPassed() {
		return isPassed;
	}
	public void setIsPassed(Integer isPassed) {
		this.isPassed = isPassed;
	}
	@Override
	public String toString() {
		return "ProductQuery [merchantname=" + merchantname + ", sortName=" + sortName + ", sortOrder=" + sortOrder
				+ ", mid=" + mid + ", quantity=" + quantity + ", isPassed=" + isPassed + ", registerTime="
				+ registerTime + "]";
	}
	
}
