package com.cafeapp.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafeapp.dto.order.OrderDetail;
import com.cafeapp.dto.order.OrderList;
import com.cafeapp.dto.order.OrderSearchCondition;
import com.cafeapp.service.order.OrderService;

@Controller
public class AdminOrderController {

	@Autowired
	OrderService orderService;
	
	//주문리스트 목록 및 검색
	@RequestMapping("/admin/orderList")
	public String orderList(Model model, @ModelAttribute OrderSearchCondition orderSearchCondition) {		
		System.out.println(orderSearchCondition);
		
		List<OrderList> orderList = orderService.findOrderListBySearchCondition(orderSearchCondition); //검색
		
		//Java 8의 Stream API를 사용하여 orderList 내의 각 주문의 totalPrice를 합산하는 방법
	    long totalOrderAmount = orderList.stream()
                						.mapToLong(order -> order.getTotalPrice())
                						.sum();
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("totalOrder", orderList.size()); //총주문건수
		model.addAttribute("totalOrderAmount", totalOrderAmount); //총주문액
		
		return "admin/adminOrderList";
	}
	
	// 모달창에 주문상세정보 나오게 하기
	@ResponseBody
	@RequestMapping("/admin/orderDetail")
	public List<OrderDetail> orderDetail(@RequestParam int orderNumber) {
		
		List<OrderDetail> orderDetailList = orderService.findOrderDetailByOrderNumber(orderNumber);
	    
		return orderDetailList;
	}
	
	
	
	
}
