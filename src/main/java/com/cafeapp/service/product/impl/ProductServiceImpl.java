package com.cafeapp.service.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeapp.dao.product.ProductDAO;
import com.cafeapp.dto.product.Product;
import com.cafeapp.service.product.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;

	@Override
	public List<Product> ShowProductList() {
		List<Product> productList = productDAO.ShowProductList();
		return productList;
	}
}
