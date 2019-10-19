package cn.lingnan.webshop.domain;

import java.util.List;

public class Product {
	private Integer id;
	private String name;
	private double price;
	private String image;
	private double discount;
	private String dateofmanufacture;
	private int termofvalidity;
	private int mid;
	private String merchantname;
	private int isPassed;
	private int ckid;
	private int quantity;
	private int isHot;
	private  String registerTime;
	private List<AttrAndVal> attribute;
	private List<SecondCatalog> secondCatalog;
	private List<Catalog> catalog;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public String getDateofmanufacture() {
		return dateofmanufacture;
	}
	public void setDateofmanufacture(String dateofmanufacture) {
		this.dateofmanufacture = dateofmanufacture;
	}
	public int getTermofvalidity() {
		return termofvalidity;
	}
	public void setTermofvalidity(int termofvalidity) {
		this.termofvalidity = termofvalidity;
	}
	public List<SecondCatalog> getSecondCatalog() {
		return secondCatalog;
	}
	public void setSecondCatalog(List<SecondCatalog> secondCatalog) {
		this.secondCatalog = secondCatalog;
	}
	public List<AttrAndVal> getAttribute() {
		return attribute;
	}
	public void setAttribute(List<AttrAndVal> attribute) {
		this.attribute = attribute;
	}
	public List<Catalog> getCatalog() {
		return catalog;
	}
	public void setCatalog(List<Catalog> catalog) {
		this.catalog = catalog;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMerchantname() {
		return merchantname;
	}
	public void setMerchantname(String merchantname) {
		this.merchantname = merchantname;
	}
	public int getIsPassed() {
		return isPassed;
	}
	public void setIsPassed(int isPassed) {
		this.isPassed = isPassed;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getCkid() {
		return ckid;
	}
	public void setCkid(int ckid) {
		this.ckid = ckid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getIsHot() {
		return isHot;
	}
	public void setIsHot(int isHot) {
		this.isHot = isHot;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
}
