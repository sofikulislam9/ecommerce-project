package com.ecommerce.service;

import com.ecommerce.model.CartItem;

import java.util.List;

public interface CartService {

    void addToCart(int userId, CartItem item);

    List<CartItem> getCartItems(int userId);
}
