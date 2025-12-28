package com.ecommerce.service.Impl;

import com.ecommerce.dao.UserDao;
import com.ecommerce.model.User;
import com.ecommerce.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public void save(User user) {

        if (!"USER".equals(user.getRole()) && !"ADMIN".equals(user.getRole())) {
            user.setRole("USER");
        }

        userDao.save(user);
    }
}
