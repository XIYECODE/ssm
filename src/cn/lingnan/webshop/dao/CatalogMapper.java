package cn.lingnan.webshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.lingnan.webshop.domain.Catalog;
import cn.lingnan.webshop.domain.Product;

public interface CatalogMapper {
	List<Catalog> find();
	List<Product> findProduct(@Param("sid") Integer sid, @Param("cid") Integer cid, @Param("value") String value, @Param("search") String searchProductContent);
	
	int add(@Param("value") String value);
	
}