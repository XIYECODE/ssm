package cn.lingnan.webshop.domain;

import cn.lingnan.webshop.domain.base.BaseDomain;

public class Merchant extends BaseDomain {
	private String storeName;
	private String storeTelephone;
	private String businessPhoto;
	private String registerTime;
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreTelephone() {
		return storeTelephone;
	}
	public void setStoreTelephone(String storeTelephone) {
		this.storeTelephone = storeTelephone;
	}
	public String getBusinessPhoto() {
		return businessPhoto;
	}
	public void setBusinessPhoto(String businessPhoto) {
		this.businessPhoto = businessPhoto;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	@Override
	public String toString() {
		return "Merchant [storeName=" + storeName + ", storeTelephone=" + storeTelephone + ", businessPhoto="
				+ businessPhoto + ", registerTime=" + registerTime + "]";
	}
}
