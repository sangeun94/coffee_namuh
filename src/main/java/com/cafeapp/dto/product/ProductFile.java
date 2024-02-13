package com.cafeapp.dto.product;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductFile {
	
	int productNumber;
	int productType; //1: 머그 2: 텀블러 3: 원두 4: 악세사리
	String productName;
	String productDescription;
	int productPrice;
	int productSize; //텀블러,머그: ml 원두: g
	int productStockQuantity;
	int productStatus; //1: 판매중 2: 품절 3: 판매종료
		
	int previousFileId; // 사용자가 선택하지 않은 경우 기존 파일 정보를 유지 : 이전 파일 ID
	
	MultipartFile profileImage; //파일

}
