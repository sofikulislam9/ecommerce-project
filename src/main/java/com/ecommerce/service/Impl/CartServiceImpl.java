package com.ecommerce.service.Impl;

import com.ecommerce.dao.CartDao;
import com.ecommerce.model.CartItem;
import com.ecommerce.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDao;

    @Override
    public void addToCart(int userId, CartItem item) {

        cartDao.addToCart(userId, item);

    }
}
