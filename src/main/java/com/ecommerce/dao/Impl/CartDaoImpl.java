package com.ecommerce.dao.Impl;

import com.ecommerce.dao.CartDao;
import com.ecommerce.model.CartItem;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl implements CartDao {

    private final JdbcTemplate jdbcTemplate;

    public CartDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void addToCart(int userId, CartItem item) {

        String sql =
                "INSERT INTO cart_items (user_id, product_id, product_name, price, quantity, image_url, total_price) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?) " +
                        "ON DUPLICATE KEY UPDATE quantity = quantity + 1, total_price = price * quantity";

        jdbcTemplate.update(sql,
                userId,
                item.getProductId(),
                item.getProductName(),
                item.getPrice(),
                item.getQuantity(),
                item.getImageUrl(),
                item.getTotalPrice()
        );

    }
}
