package com.ecommerce.controller;

import com.ecommerce.model.User;
import com.ecommerce.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String logIn() {
        return "auth/login";
    }

    @GetMapping("/auth/register")
    public  String registerUser(@RequestParam(value = "type", required = false) String type, Model model){

        String role = "USER";

        if ("admin".equalsIgnoreCase(type)) {
            role = "ADMIN";
        }

        model.addAttribute("role", role);
        return "auth/register";
    }

    @PostMapping("/register")
    public String save(@ModelAttribute User user, Model model) {

        try{
            userService.save(user);
            model.addAttribute("success","Registration successful!");
        } catch (Exception e) {
            model.addAttribute("error", "Email already exists");
        }

        model.addAttribute("role", user.getRole());
        return "redirect:/home";
    }

}
