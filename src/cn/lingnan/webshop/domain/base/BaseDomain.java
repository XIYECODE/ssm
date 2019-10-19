package cn.lingnan.webshop.domain.base;

public class BaseDomain {
	private Integer id;					//id
	private String loginName;		//登录名
	private String name;					//实名
	private String password;			//密码
	private String telephone;			//联系电话
	private String email;					//E-mail
	private String address;				//地址
	private int del_status;				//删除状态
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getDel_status() {
		return del_status;
	}
	public void setDel_status(int del_status) {
		this.del_status = del_status;
	}
	@Override
	public String toString() {
		return "BaseDomain [id=" + id + ", loginName=" + loginName + ", name=" + name + ", password=" + password
				+ ", telephone=" + telephone + ", email=" + email + ", address=" + address + ", del_status="
				+ del_status + "]";
	}
}
