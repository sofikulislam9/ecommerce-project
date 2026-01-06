package com.ecommerce.dao.Impl;

import com.ecommerce.dao.CartDao;
import com.ecommerce.model.CartItem;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    @Override
    public List<CartItem> getCartItems(int userId) {

        String sql = "SELECT * FROM cart_items WHERE user_id = ?";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {

            CartItem item = new CartItem();
            item.setId(rs.getInt("id"));
            item.setProductId(rs.getInt("product_id"));
            item.setProductName(rs.getString("product_name"));
            item.setPrice(rs.getDouble("price"));
            item.setQuantity(rs.getInt("quantity"));
            item.setImageUrl(rs.getString("image_url"));
            item.setTotalPrice(rs.getDouble("total_price"));
            return item;

        }, userId);

    }
}
