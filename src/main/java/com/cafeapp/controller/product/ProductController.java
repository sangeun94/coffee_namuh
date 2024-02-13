package com.cafeapp.controller.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cafeapp.dto.product.Product;
import com.cafeapp.service.product.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/store/product")
	public String StroreProduct(Model model) {
		List<Product> productList = productService.ShowProductList();
	    model.addAttribute("productList", productList);
		return "product/product";
	}

}
