package com.cafeapp.dto.product;

import com.cafeapp.dto.menu.MenuList;

import lombok.Data;

@Data
public class ProductList {

	int productNumber;
	int productType; //1: 머그 2: 텀블러 3: 원두 4: 악세사리
	String productName;
	String productDescription;
	Integer productPrice;
	Integer productSize; //텀블러,머그: ml 원두: g
	Integer productStockQuantity;
	Integer productStatus; //1: 판매중 2: 품절 3: 판매종료
	Integer fileId;
	
	String fileName; // menu_drink_cold_brew_coffee_나이트로_바닐라_크림.jpg //랜덤이름
	String originalFileName; //원래이름
	String filePath; // /fileStorage/drink/
	String fileExtension;
	long fileSize;
	
	String fullFilePath; // join 으로 한번에 file_path + file_name 가져오는 경우
}
