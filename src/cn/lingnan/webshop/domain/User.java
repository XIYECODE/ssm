package cn.lingnan.webshop.domain;

import cn.lingnan.webshop.domain.base.BaseDomain;

public class User extends BaseDomain {
	private String sex;

	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
}
