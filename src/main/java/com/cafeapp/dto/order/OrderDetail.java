package com.cafeapp.dto.order;

import lombok.Data;

@Data
public class OrderDetail {

	int orderNumber;
	String productName;
	int orderQuantity;
	int price;
	
}
