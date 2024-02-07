package com.cafeapp.controller.shoppingcart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafeapp.dto.shoppingcart.ShoppingCart;
import com.cafeapp.service.shoppingcart.ShoppingCartService;

@Controller
public class ShoppingCartController {
	
	 @Autowired
	 ShoppingCartService shoppingCartService;
	
	 @RequestMapping("/shoppingcart")
		public String Notice() {
			return "shoppingCart/shoppingCart";
		}
}
