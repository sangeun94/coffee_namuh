package com.cafeapp.dto.product;

import lombok.Data;

@Data
public class ProductSearchCondition {
	int productNumber;
	String productName;
	String productDescription;	
	
	Integer productPrice;
	Integer minPrice; //가격
	Integer maxPrice;
	
	Integer productSize; 
	Integer mlSizeStart; //텀블러,머그: ml
	Integer mlSizeEnd;
	Integer beansSizeStart; //원두: g
	Integer beansSizeEnd;
	
	Integer productStockQuantity;
	Integer productStatus;
	Integer productType;
	
	String searchType;
	String searchKeyword;	
	
}
