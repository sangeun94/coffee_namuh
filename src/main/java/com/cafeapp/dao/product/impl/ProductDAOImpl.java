package com.cafeapp.dao.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.product.ProductDAO;
import com.cafeapp.dto.product.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Product> ShowProductList() {

		// TODO Auto-generated method stub
		List<Product> productList = sqlSessionTemplate.selectList("product_mapper.ShowProductList");

		return productList;
	}
}
