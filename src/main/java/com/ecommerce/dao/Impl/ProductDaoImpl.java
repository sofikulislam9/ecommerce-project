package com.ecommerce.dao.Impl;

import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Product;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao {

    private final JdbcTemplate jdbcTemplate;

    public ProductDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Product> rowMapper =new RowMapper<Product>() {

        @Override
        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {

            Product p = new Product();
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setDescription(rs.getString("description"));
            p.setBrand(rs.getString("brand"));
            p.setCategory(rs.getString("category"));
            p.setPrice(rs.getDouble("price"));
            p.setStockQuantity(rs.getInt("stock_quantity"));
            p.setImageUrl(rs.getString("image_url"));
            p.setActive(rs.getBoolean("active"));

            return p;
        }
    };

    @Override
    public List<Product> getAllProducts() {

        String SQL = "SELECT * FROM products WHERE active = true";

        return jdbcTemplate.query(SQL, rowMapper);
    }
}
