package cn.lingnan.webshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.domain.Product;
import cn.lingnan.webshop.query.ProductQuery;
import cn.lingnan.webshop.service.base.BaseService;

public interface ProductService extends BaseService<Product, ProductQuery> {
	//PageInfo<Product> getProduct(ProductQuery query);
	//List<Product> findProduct(Integer sid, Integer cid, String value, String searchProductContent);
	int addProduct(Product p);
	Product findByProductId(Integer cid, Integer pid);
	PageInfo<Product> getProductByCid(Integer cid);
	PageInfo<Product> getProductBySid(Integer sid);
	PageInfo<Product> findProductByKeyword(Integer cid, Integer sid, String keyword);
	PageInfo<Product> findMoreProduct(Integer sid, Double minprice,  Double maxprice, String ... attrArray);
	
	
	PageInfo<Product> getShortProducts(ProductQuery product);
	
	
	PageInfo<Product> getUnPassProducts(ProductQuery product);
	List<Product> getUnPassList();
	boolean pass(Integer pid);
}
