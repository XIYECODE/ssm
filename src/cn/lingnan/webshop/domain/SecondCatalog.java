package cn.lingnan.webshop.domain;

public class SecondCatalog {
	private Integer scid;
	private String scname;
	private Integer ckid;
	public Integer getScid() {
		return scid;
	}
	public void setScid(Integer scid) {
		this.scid = scid;
	}
	public String getScname() {
		return scname;
	}
	public void setScname(String scname) {
		this.scname = scname;
	}
	public Integer getCkid() {
		return ckid;
	}
	public void setCkid(Integer ckid) {
		this.ckid = ckid;
	}
	@Override
	public String toString() {
		return "SecondCatalog [scid=" + scid + ", scname=" + scname + ", ckid=" + ckid + "]";
	}
}
