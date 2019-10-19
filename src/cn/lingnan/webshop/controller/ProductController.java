package cn.lingnan.webshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.lingnan.webshop.controller.base.BaseController;
import cn.lingnan.webshop.domain.Product;
import cn.lingnan.webshop.query.ProductQuery;
import cn.lingnan.webshop.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController extends BaseController<Product, ProductQuery> {
	@Autowired
	public void setProductService(ProductService productService) {
		this.baseService = productService;
	}
	/*======================2019-04-25==============================*/
	
}
