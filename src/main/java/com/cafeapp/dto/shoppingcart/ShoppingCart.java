package com.cafeapp.dto.shoppingcart;

import lombok.Data;

@Data
public class ShoppingCart {

	String userId;
	int productNumber;
	int cartQuantity;
}
