package com.cafeapp.dao.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.order.OrderDAO;
import com.cafeapp.dto.order.Order;
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
	

	//주문상태2 로 변경
	@Override
	public int updateOrderStatus1(Order order) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("order_mapper.updateOrderStatus1", order);
		
		return result;
	}

	//배송준비 리스트 및 검색
	@Override
	public List<OrderList> findDeliveryPrepareBySearchCondition(OrderSearchCondition orderSearchCondition) {
		// TODO Auto-generated method stub
		
		List<OrderList> orderList = 
				sqlSessionTemplate.selectList("order_mapper.findDeliveryPrepareBySearchCondition", orderSearchCondition);
		
		return orderList;
	}

	//배송준비 단계에서 운송장번호 수기입력 -> 수정
	@Override
	public int updateTrackingNumber(Order order) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("order_mapper.updateTrackingNumber", order);
		
		return result;
	}
	
	//주문상태 3로 상태 변경
	@Override
	public int updateOrderStatus2(Order order) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("order_mapper.updateOrderStatus2", order);
		
		return result;
	}


	//배송중 리스트 및 검색
	@Override
	public List<OrderList> findDeliveringBySearchCondition(OrderSearchCondition orderSearchCondition) {
		// TODO Auto-generated method stub
		List<OrderList> orderList = 
				sqlSessionTemplate.selectList("order_mapper.findDeliveringBySearchCondition", orderSearchCondition);
		
		return orderList;
	}
	
	//주문상태 4로 상태 변경
	@Override
	public int updateOrderStatus3(Order order) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("order_mapper.updateOrderStatus3", order);
		
		return result;
	}

	//배송완료 리스트 및 검색
	@Override
	public List<OrderList> findDeliveryCompleteBySearchCondition(OrderSearchCondition orderSearchCondition) {
		// TODO Auto-generated method stub
		List<OrderList> orderList = 
				sqlSessionTemplate.selectList("order_mapper.findDeliveryCompleteBySearchCondition", orderSearchCondition);
		
		return orderList;
	}

	//주문리스트(전체) 목록 및 검색
	@Override
	public List<OrderList> findTotalOrderListBySearchCondition(OrderSearchCondition orderSearchCondition) {
		// TODO Auto-generated method stub
		List<OrderList> orderList = 
				sqlSessionTemplate.selectList("order_mapper.findTotalOrderListBySearchCondition", orderSearchCondition);
		
		return orderList;
	}

	
}
