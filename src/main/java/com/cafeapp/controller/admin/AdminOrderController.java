package com.cafeapp.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafeapp.dto.order.Order;
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
	
	// 발주확인 눌렀을때 배송준비중(2)로 수정
	@PostMapping("/admin/modifyOrderStatus1")
	public String modifyOrderStatus1(Order order, RedirectAttributes redirectAttributes) {
	    System.out.println(order);
	    
	    int result = orderService.updateOrderStatus1(order);
	    
	    if (result > 0) {
	        // 성공 시 메시지 설정
	        redirectAttributes.addFlashAttribute("successMessage", "발주 확인되었습니다.");
	        return "redirect:/admin/orderList";
	    } else {
	        // 실패 시 메시지 설정
	        redirectAttributes.addFlashAttribute("errorMessage", "실패하셨습니다.");
	        return "redirect:/admin/orderList"; // 실패 시에도 동일한 페이지로
	    }
	}
	
	
	//배송준비 목록 및 검색
	@RequestMapping("/admin/deliveryPrepare")
	public String deliveryPrepare(Model model, @ModelAttribute OrderSearchCondition orderSearchCondition) {
		System.out.println(orderSearchCondition);
		
		List<OrderList> orderList = orderService.findDeliveryPrepareBySearchCondition(orderSearchCondition); //검색
		
		//Java 8의 Stream API를 사용하여 orderList 내의 각 주문의 totalPrice를 합산하는 방법
	    long totalOrderAmount = orderList.stream()
                						.mapToLong(order -> order.getTotalPrice())
                						.sum();
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("totalOrder", orderList.size()); //총주문건수
		model.addAttribute("totalOrderAmount", totalOrderAmount); //총주문액

		return "admin/adminDeliveryPrepare";
	}
	
	//배송준비 단계에서 운송장번호 수기입력 -> 수정
    @PostMapping("/admin/updateTrackingNumber")
    public String updateTrackingNumber(Order order, RedirectAttributes redirectAttributes) {
        int result = orderService.updateTrackingNumber(order);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("successMessage", "운송장 번호가 저장되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "운송장 번호 저장에 실패했습니다.");
        }
        return "redirect:/admin/deliveryPrepare";
    }
    
	// 배송시작 눌렀을때 배송중(3)로 수정
	@PostMapping("/admin/modifyOrderStatus2")
	public String modifyOrderStatus2(Order order, RedirectAttributes redirectAttributes) {
	    System.out.println(order);
	    
	    int result = orderService.updateOrderStatus2(order);
	    
	    if (result > 0) {
	        // 성공 시 메시지 설정
	        redirectAttributes.addFlashAttribute("successMessage", "배송 시작되었습니다.");
	        return "redirect:/admin/deliveryPrepare";
	    } else {
	        // 실패 시 메시지 설정
	        redirectAttributes.addFlashAttribute("errorMessage", "실패하셨습니다.");
	        return "redirect:/admin/deliveryPrepare"; // 실패 시에도 동일한 페이지로
	    }
	}
	
	//배송중 목록 및 검색
	@RequestMapping("/admin/delivering")
	public String delivering(Model model, @ModelAttribute OrderSearchCondition orderSearchCondition) {
		System.out.println(orderSearchCondition);
		
		List<OrderList> orderList = orderService.findDeliveringBySearchCondition(orderSearchCondition); //검색
		
		//Java 8의 Stream API를 사용하여 orderList 내의 각 주문의 totalPrice를 합산하는 방법
	    long totalOrderAmount = orderList.stream()
                						.mapToLong(order -> order.getTotalPrice())
                						.sum();
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("totalOrder", orderList.size()); //총주문건수
		model.addAttribute("totalOrderAmount", totalOrderAmount); //총주문액

		return "admin/adminDelivering";
	}
	
	// 배송완료 눌렀을때 배송완료(4)로 수정
	@PostMapping("/admin/modifyOrderStatus3")
	public String modifyOrderStatus3(Order order, RedirectAttributes redirectAttributes) {
	    System.out.println(order);
	    
	    int result = orderService.updateOrderStatus3(order);
	    
	    if (result > 0) {
	        // 성공 시 메시지 설정
	        redirectAttributes.addFlashAttribute("successMessage", "배송 완료되었습니다.");
	        return "redirect:/admin/delivering";
	    } else {
	        // 실패 시 메시지 설정
	        redirectAttributes.addFlashAttribute("errorMessage", "실패하셨습니다.");
	        return "redirect:/admin/delivering"; // 실패 시에도 동일한 페이지로
	    }
	}
	
	//배송완료 목록 및 검색
	@RequestMapping("/admin/deliveryComplete")
	public String deliveryComplete(Model model, @ModelAttribute OrderSearchCondition orderSearchCondition) {
		System.out.println(orderSearchCondition);
		
		List<OrderList> orderList = orderService.findDeliveryCompleteBySearchCondition(orderSearchCondition); //검색
		
		//Java 8의 Stream API를 사용하여 orderList 내의 각 주문의 totalPrice를 합산하는 방법
	    long totalOrderAmount = orderList.stream()
                						.mapToLong(order -> order.getTotalPrice())
                						.sum();
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("totalOrder", orderList.size()); //총주문건수
		model.addAttribute("totalOrderAmount", totalOrderAmount); //총주문액

		return "admin/adminDeliveryComplete";
	}
	
}
