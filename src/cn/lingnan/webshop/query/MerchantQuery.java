package cn.lingnan.webshop.query;

import cn.lingnan.webshop.query.base.BaseQuery;

public class MerchantQuery extends BaseQuery {
	private String registerTime;
	private Integer isPassed;

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
		return "MerchantQuery [registerTime=" + registerTime + ", isPassed=" + isPassed + "]";
	}
}
