package com.cafeapp.service.order;

import java.util.List;

import com.cafeapp.dto.order.OrderDetail;
import com.cafeapp.dto.order.OrderList;
import com.cafeapp.dto.order.OrderSearchCondition;


public interface OrderService {
	
	//주문리스트 조회 + 검색
	public List<OrderList> findOrderListBySearchCondition(OrderSearchCondition orderSearchCondition);

	//각각 주문상세
	public List<OrderDetail> findOrderDetailByOrderNumber(int orderNumber);
}
