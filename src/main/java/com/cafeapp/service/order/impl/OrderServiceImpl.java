package com.cafeapp.service.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeapp.dao.order.OrderDAO;
import com.cafeapp.dto.order.Order;
import com.cafeapp.dto.order.OrderDetail;
import com.cafeapp.dto.order.OrderList;
import com.cafeapp.dto.order.OrderSearchCondition;
import com.cafeapp.service.order.OrderService;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderDAO orderDAO;

	//주문리스트 목록 및 검색 
	@Override
	public List<OrderList> findOrderListBySearchCondition(OrderSearchCondition orderSearchCondition) {
		// TODO Auto-generated method stub
		
		List<OrderList> orderList = orderDAO.findOrderListBySearchCondition(orderSearchCondition);
		
		return orderList;
	}

	//각각 주문상세
	@Override
	public List<OrderDetail> findOrderDetailByOrderNumber(int orderNumber) {
		// TODO Auto-generated method stub
		
		List<OrderDetail> orderDetailList = orderDAO.findOrderDetailByOrderNumber(orderNumber);
		
		return orderDetailList;
	}
	
	//주문상태 2로 변경
	@Override
	public int updateOrderStatus1(Order order) {
		// TODO Auto-generated method stub
		
		int result = orderDAO.updateOrderStatus1(order);
		
		return result;
	}

	//배송준비 리스트 조회 + 검색
	@Override
	public List<OrderList> findDeliveryPrepareBySearchCondition(OrderSearchCondition orderSearchCondition) {
		// TODO Auto-generated method stub
		
		List<OrderList> orderList = orderDAO.findDeliveryPrepareBySearchCondition(orderSearchCondition);
		
		return orderList;

	}

	//배송준비 단계에서 운송장번호 수기입력 -> 수정
	@Override
	public int updateTrackingNumber(Order order) {
		// TODO Auto-generated method stub
		
		int result = orderDAO.updateTrackingNumber(order);
		
		return result;
	}
	
	//주문상태 3로 변경
	@Override
	public int updateOrderStatus2(Order order) {
		// TODO Auto-generated method stub
		
		int result = orderDAO.updateOrderStatus2(order);
		
		return result;
	}

	//배송중 리스트 조회 + 검색
	@Override
	public List<OrderList> findDeliveringBySearchCondition(OrderSearchCondition orderSearchCondition) {
		// TODO Auto-generated method stub
		
		List<OrderList> orderList = orderDAO.findDeliveringBySearchCondition(orderSearchCondition);
		
		return orderList;
	}
	
	//주문상태 4로 변경
	@Override
	public int updateOrderStatus3(Order order) {
		// TODO Auto-generated method stub
		
		int result = orderDAO.updateOrderStatus3(order);
		
		return result;
	}
	
	//배송완료 리스트 조회 + 검색
	@Override
	public List<OrderList> findDeliveryCompleteBySearchCondition(OrderSearchCondition orderSearchCondition) {
		// TODO Auto-generated method stub
		
		List<OrderList> orderList = orderDAO.findDeliveryCompleteBySearchCondition(orderSearchCondition);
		
		return orderList;
	}
	
}
