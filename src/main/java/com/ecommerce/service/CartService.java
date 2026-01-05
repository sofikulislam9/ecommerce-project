package com.ecommerce.service;

import com.ecommerce.model.CartItem;

public interface CartService {

    void addToCart(int userId, CartItem item);
}
