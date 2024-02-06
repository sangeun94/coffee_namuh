package com.cafeapp.dao.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.order.OrderDAO;
import com.cafeapp.dto.order.OrderDetail;
import com.cafeapp.dto.order.OrderList;
import com.cafeapp.dto.order.OrderSearchCondition;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; //의존성 주입

	//주문리스트 목록 및 검색
	@Override
	public List<OrderList> findOrderListBySearchCondition(OrderSearchCondition orderSearchCondition) {
		// TODO Auto-generated method stub
		List<OrderList> orderList = 
				sqlSessionTemplate.selectList("order_mapper.findOrderListBySearchCondition", orderSearchCondition);
		
		return orderList;
	}
	
	
	//각각 주문상세
	@Override
	public List<OrderDetail> findOrderDetailByOrderNumber(int orderNumber) {
		// TODO Auto-generated method stub
		
		List<OrderDetail> orderDetailList = sqlSessionTemplate.selectList("order_mapper.findOrderDetailByOrderNumber", orderNumber);
		
		return orderDetailList;
	}
	
	
}
