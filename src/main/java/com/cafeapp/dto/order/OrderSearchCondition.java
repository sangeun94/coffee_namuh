package com.cafeapp.dto.order;

import lombok.Data;

@Data
public class OrderSearchCondition {

	int orderNumber;
	String productName;
	String ordererName; //주문자이름 = user_name
    String orderDateStart; //시작일
    String orderDateEnd; //종료일
	int paymentMethod; //1:신용카드, 2:휴대폰결제, 3:무통장입금
	String trackingNumber; 
	
	String searchType;
	String searchKeyword;
}
