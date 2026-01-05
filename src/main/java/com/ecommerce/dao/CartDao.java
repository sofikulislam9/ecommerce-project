package com.ecommerce.dao;

import com.ecommerce.model.CartItem;

public interface CartDao {

    void addToCart(int userId, CartItem item);
}
