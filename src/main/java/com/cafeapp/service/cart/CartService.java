package com.cafeapp.service.cart;

import java.util.List;

import com.cafeapp.dto.cart.Cart;

public interface CartService {
	// 장바구니에 담긴 모든 상품 목록을 반환합니다.
    List <Cart> getAllItems();
    
    // 장바구니에 상품을 추가합니다.
    void addItem(Cart item);
    
    // 장바구니에 담긴 상품을 업데이트합니다.
    void updateItem(Cart item);
    
    // 장바구니에서 상품을 삭제합니다.
    void removeItem(Long itemId);
}
