package cn.lingnan.webshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.lingnan.webshop.dao.base.BaseMapper;
import cn.lingnan.webshop.domain.Product;
import cn.lingnan.webshop.query.ProductQuery;

public interface ProductMapper extends BaseMapper<Product, ProductQuery> {
	//List<Product> find();
	//List<Product> findProduct(@Param("sid") Integer sid, @Param("cid") Integer cid, @Param("value") String value, @Param("search") String searchProductContent);
	Product findByProductId(@Param("cid") Integer cid, @Param("pid") Integer pid);
	int addProduct(Product p);
	
	List<Product> getProductByCid(@Param("cid") Integer cid);
	List<Product> getProductBySid(@Param("sid") Integer sid);
	List<Product> findProductByKeyword(@Param("cid") Integer cid, @Param("sid") Integer sid, @Param("keyword")String keyword);
	List<Product> findMoreProduct(@Param("sid") Integer sid, @Param("minprice")Double minprice,  @Param("maxprice")Double maxprice, @Param("attrArray")String ... attrArray);
	
	List<Product> getShortProducts(ProductQuery product);
	
	
	List<Product> getUnPassProducts(ProductQuery product);
	int pass(@Param("pid") Integer pid);
	
}