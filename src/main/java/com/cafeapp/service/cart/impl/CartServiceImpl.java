package com.cafeapp.service.cart.impl;

import java.util.ArrayList;
import java.util.List;

import com.cafeapp.dto.cart.Cart;
import com.cafeapp.service.cart.CartService;

public class CartServiceImpl implements CartService {
	// 장바구니 상품 목록을 저장하는 리스트
	private List<Cart> cartItems = new ArrayList<>();

	@Override
	public List<Cart> getAllItems() {
		return cartItems;
	}

	@Override
	public void addItem(Cart item) {
		cartItems.add(item);
	}

	@Override
	public void updateItem(Cart item) {
		for (Cart cartItem : cartItems) {
			if (cartItem.getId().equals(item.getId())) {
				cartItem.setQuantity(item.getQuantity());
				break;
			}
		}
	}

	@Override
	public void removeItem(Long itemId) {
		cartItems.removeIf(item -> item.getId().equals(itemId));
	}
}
