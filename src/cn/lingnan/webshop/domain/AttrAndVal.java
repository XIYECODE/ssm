package cn.lingnan.webshop.domain;

public class AttrAndVal {
	private Integer attrid;
	private String value;
	private Integer skid;
	private Integer pkid;
	public Integer getAttrid() {
		return attrid;
	}
	public void setAttrid(Integer attrid) {
		this.attrid = attrid;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Integer getSkid() {
		return skid;
	}
	public void setSkid(Integer skid) {
		this.skid = skid;
	}
	public Integer getPkid() {
		return pkid;
	}
	public void setPkid(Integer pkid) {
		this.pkid = pkid;
	}
	@Override
	public String toString() {
		return "AttrAndVal [attrid=" + attrid + ", value=" + value + ", skid=" + skid + ", pkid=" + pkid + "]";
	}
	@Override
	public boolean equals(Object o) {
		if (o instanceof AttrAndVal) {
			AttrAndVal question = (AttrAndVal) o;
			System.out.println("question.value = "+question.value+",this.value.equals = "+this.value);
			return this.attrid.equals(question.attrid)
					&& question.value==null || this.value == null  ? true : this.value.equals(question.value)
					&& this.skid.equals(question.skid)
					&& this.pkid.equals(question.pkid);
		}
		return super.equals(o);
	}
}
