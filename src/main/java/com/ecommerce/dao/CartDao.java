package com.ecommerce.dao;

import com.ecommerce.model.CartItem;

import java.util.List;

public interface CartDao {

    void addToCart(int userId, CartItem item);

    List<CartItem> getCartItems(int userId);
}
