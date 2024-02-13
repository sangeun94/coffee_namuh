package com.cafeapp.dto.product;

import lombok.Data;

@Data
public class Product {
	int productNumber;
	int productType;
	String productName;
	String productDescription;
	int producPrice;
	String productSize;
	int productStockQuantity;
	int productStatus;
	int fileId;
	String filePath;
	String fileName;
	String originalFileName;
}
