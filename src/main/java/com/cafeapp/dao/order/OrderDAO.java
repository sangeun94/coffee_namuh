package com.cafeapp.dao.order;

import java.util.List;

import com.cafeapp.dto.order.Order;
import com.cafeapp.dto.order.OrderDetail;
import com.cafeapp.dto.order.OrderList;
import com.cafeapp.dto.order.OrderSearchCondition;

public interface OrderDAO {

	//주문리스트 목록 및 검색
	public List<OrderList> findOrderListBySearchCondition(OrderSearchCondition orderSearchCondition);

	//각각 주문상세
	public List<OrderDetail> findOrderDetailByOrderNumber(int orderNumber);
	
	//주문상태1 로 변경
	public int updateOrderStatus1(Order order);
	
	//배송준비리스트 목록 및 검색
	public List<OrderList> findDeliveryPrepareBySearchCondition(OrderSearchCondition orderSearchCondition);

	//주문상태2 로 변경
	public int updateOrderStatus2(Order order);
	
	//배송중 리스트 목록 및 검색
	public List<OrderList> findDeliveringBySearchCondition(OrderSearchCondition orderSearchCondition);

	//주문상태3 로 변경
	public int updateOrderStatus3(Order order);
	
	//배송완료 리스트 목록 및 검색
	public List<OrderList> findDeliveryCompleteBySearchCondition(OrderSearchCondition orderSearchCondition);

	
}
