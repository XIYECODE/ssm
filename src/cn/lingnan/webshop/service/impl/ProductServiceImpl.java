package cn.lingnan.webshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.lingnan.webshop.dao.ProductMapper;
import cn.lingnan.webshop.domain.Product;
import cn.lingnan.webshop.query.ProductQuery;
import cn.lingnan.webshop.service.ProductService;
import cn.lingnan.webshop.service.base.impl.BaseServiceImpl;

@Service
public class ProductServiceImpl extends BaseServiceImpl<Product, ProductQuery> implements ProductService {
	
	@Autowired
	public void setProductMapper(ProductMapper productMapper) {
		this.baseMapper = productMapper;
	}
	
	@Autowired
	ProductMapper pMapper;

	@Override
	public int addProduct(Product p) {
		return pMapper.addProduct(p);
	}

	@Override
	public Product findByProductId(Integer cid, Integer pid) {
		return pMapper.findByProductId(cid, pid);
	}
	
	/*public List<Product> findProduct(Integer sid, Integer cid, String value, String searchProductContent) {
		return pMapper.findProduct(sid, cid, value, searchProductContent);
	}*/

	@Override
	public PageInfo<Product> getProductByCid(Integer cid) {
		PageHelper.startPage(1, 10);							//不可缺少，否则报错
		Page<Product> list = (Page<Product>) pMapper.getProductByCid(cid);
		return list.toPageInfo();
	}

	@Override
	public PageInfo<Product> findProductByKeyword(Integer cid, Integer sid, String keyword) {
		PageHelper.startPage(1, 10);							//不可缺少，否则报错
		Page<Product> list = (Page<Product>) pMapper.findProductByKeyword(cid, sid, keyword);
		return list.toPageInfo();
	}

	@Override
	public PageInfo<Product> getProductBySid(Integer sid) {
		PageHelper.startPage(1, 10);							//不可缺少，否则报错
		Page<Product> list = (Page<Product>) pMapper.getProductBySid(sid);
		return list.toPageInfo();
	}

	@Override
	public PageInfo<Product> findMoreProduct(Integer sid, Double minprice, Double maxprice, String... attrArray) {
		PageHelper.startPage(1, 10);							//不可缺少，否则报错
		Page<Product> list = (Page<Product>) pMapper.findMoreProduct(sid, minprice, maxprice, attrArray);
		return list.toPageInfo();
	}

	@Override
	public PageInfo<Product> getShortProducts(ProductQuery pQuery) {
		PageHelper.startPage(pQuery.getPageNum(), pQuery.getPageSize());							//不可缺少，否则报错
		Page<Product> list = (Page<Product>) pMapper.getShortProducts(pQuery);
		return  list.toPageInfo();
	}
	
	@Override
	public PageInfo<Product> getUnPassProducts(ProductQuery pQuery) {
		PageHelper.startPage(pQuery.getPageNum(), pQuery.getPageSize());							//不可缺少，否则报错
		Page<Product> list = (Page<Product>) pMapper.getUnPassProducts(pQuery);
		return  list.toPageInfo();
	}

	@Override
	public List<Product> getUnPassList() {
		return pMapper.getUnPassProducts(null);
	}

	@Override
	public boolean pass(Integer pid) {
		if (pMapper.pass(pid) > 0) {
			return true;
		}
		return false;
	}
}
