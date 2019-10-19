package cn.lingnan.webshop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.domain.Catalog;
import cn.lingnan.webshop.domain.Product;

public interface CatalogService {
	PageInfo<Catalog> getCatalog();
	List<Product> findProduct(Integer sid, Integer cid, String value, String searchProductContent);
	boolean addCatalog(String value);
}
