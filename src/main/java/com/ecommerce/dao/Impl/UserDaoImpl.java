package com.ecommerce.dao.Impl;

import com.ecommerce.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class UserDaoImpl implements UserDao{

    private final JdbcTemplate jdbcTemplate;

    public UserDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<User> rowMapper = new RowMapper<User>() {

        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {

            User u = new User();
            u.setId(rs.getInt("id"));
            u.setName(rs.getString("name"));
            u.setEmail(rs.getString("email"));
            u.setPassword(rs.getString("password"));
            u.setRole(rs.getString("role"));
            u.setPhone(rs.getString("phone"));

            return u;
        }
    };

    @Override
    public void save(User user) {

        String SQL = "INSERT INTO users (name, email, password, role, phone) VALUES (?, ?, ?, ?, ?)";

        jdbcTemplate.update(SQL,user.getName(), user.getEmail(),
                user.getPassword(), user.getRole(), user.getPhone());
    }
}
