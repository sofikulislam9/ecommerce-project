package com.ecommerce.service;

import com.ecommerce.model.User;

public interface UserService {

    void save(User user);

    User login(String email, String password);
}
