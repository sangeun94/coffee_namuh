package com.cafeapp.controller.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafeapp.service.cart.CartService;

@Controller
public class CartController {
	
    @Autowired
    CartService cartService;

    @RequestMapping("/cart")
    public String showCart() {
        // 장바구니 내용을 표시하는 뷰로 이동합니다.
        // 필요한 코드를 작성하세요.
        return "cart/cart";
    }

//    @PostMapping("/cart/add")
//    public String addItemToCart(@RequestParam Long productId, @RequestParam int quantity) {
//        // 장바구니에 상품을 추가하고, 장바구니 화면으로 리디렉션합니다.
//        // 필요한 코드를 작성하세요.
//        return "redirect:/cart";
//    }
//
//    @PostMapping("/cart/update")
//    public String updateItemInCart(@RequestParam Long itemId, @RequestParam int quantity) {
//        // 장바구니에 있는 상품의 수량을 업데이트하고, 장바구니 화면으로 리디렉션합니다.
//        // 필요한 코드를 작성하세요.
//        return "redirect:/cart";
//    }
//
//    @PostMapping("/cart/remove")
//    public String removeItemFromCart(@RequestParam Long itemId) {
//        // 장바구니에서 상품을 삭제하고, 장바구니 화면으로 리디렉션합니다.
//        // 필요한 코드를 작성하세요.
//        return "redirect:/cart";
//    }
}
