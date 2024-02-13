package com.cafeapp.dao.shoppingcart.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafeapp.dao.shoppingcart.ShoppingCartDAO;
import com.cafeapp.dto.shoppingcart.ShoppingCart;

@Repository
public class ShoppingCartDAOImpl implements ShoppingCartDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;
    
   
}