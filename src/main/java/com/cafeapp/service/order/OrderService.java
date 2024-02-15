package com.cafeapp.service.order;

import java.util.List;

import com.cafeapp.dto.order.Order;
import com.cafeapp.dto.order.OrderDetail;
import com.cafeapp.dto.order.OrderList;
import com.cafeapp.dto.order.OrderSearchCondition;


public interface OrderService {
	
	//주문리스트 조회 + 검색
	public List<OrderList> findOrderListBySearchCondition(OrderSearchCondition orderSearchCondition);

	//각각 주문상세
	public List<OrderDetail> findOrderDetailByOrderNumber(int orderNumber);
		
	//주문상태2 로 변경
	public int updateOrderStatus1(Order order);
	
	//배송준비 리스트 조회 + 검색
	public List<OrderList> findDeliveryPrepareBySearchCondition(OrderSearchCondition orderSearchCondition);

	//배송준비 단계에서 운송장번호 수기입력 -> 수정
    public int updateTrackingNumber(Order order);	

	//주문상태3 로 변경
	public int updateOrderStatus2(Order order);
	
	//배송중 리스트 목록 및 검색
	public List<OrderList> findDeliveringBySearchCondition(OrderSearchCondition orderSearchCondition);

	//주문상태4 로 변경
	public int updateOrderStatus3(Order order);

	//배송중 리스트 목록 및 검색
	public List<OrderList> findDeliveryCompleteBySearchCondition(OrderSearchCondition orderSearchCondition);

	//주문리스트(전체) 목록 및 검색
	public List<OrderList> findTotalOrderListBySearchCondition(OrderSearchCondition orderSearchCondition);

}
