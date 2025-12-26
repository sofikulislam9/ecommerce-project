package com.ecommerce.controller;

import com.ecommerce.model.User;
import com.ecommerce.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {

    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String logIn() {
        return "auth/login";
    }

    @GetMapping("/auth/register")
    public  String registerUser(){
        return "auth/register";
    }

    @PostMapping("/register")
    public String save(User user) {
        userService.save(user);

        return "redirect:/home";
    }

}
