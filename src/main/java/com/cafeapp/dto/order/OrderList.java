package com.cafeapp.dto.order;

import lombok.Data;

@Data
public class OrderList {
	
	int orderNumber;
	String orderDate;
	
	String firstProductName;
	int additionalProductCount;
	
	int totalQuantity;
	int shippingFee;
	int orderStatus; //0:상품준비중 1:배송준비중 2:배송중 3:배송완료 4:주문취소 5:구매확정
	String ordererName; //주문자이름 = user_name
	int totalPrice;
	int paymentMethod; //1:신용카드, 2:휴대폰결제, 3:무통장입금
	
	String courierName; //택배회사
	String trackingNumber; //운송장번호
	
}
