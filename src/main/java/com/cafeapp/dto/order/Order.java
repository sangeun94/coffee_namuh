package com.cafeapp.dto.order;

import lombok.Data;

@Data
public class Order {
	
	int orderNumber;
	String userId;
	String orderDate;
	int totalPrice;
	int shippingFee;
	String courierName;
	String trackingNumber;
	int orderStatus; //0:상품준비중 1:배송준비중 2:배송중 3:배송완료 4:주문취소 5:구매확정
	
}
