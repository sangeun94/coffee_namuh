package com.cafeapp.service.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafeapp.dao.order.OrderDAO;
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
	
}
