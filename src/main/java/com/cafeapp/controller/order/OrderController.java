package com.cafeapp.controller.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafeapp.service.order.OrderService;

@Controller
public class OrderController {

	@Autowired
    OrderService orderService;

    @RequestMapping("/cart/order")
    public String order() {
        // 장바구니 내용을 표시하는 뷰로 이동합니다.
        // 필요한 코드를 작성하세요.
        return "order/order";
    }
}
