package com.cafeapp.dto.cart;

import lombok.Data;

@Data
public class Cart {
	private Long id;
	private Long productId;
	private int quantity;
}
