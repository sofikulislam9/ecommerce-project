package com.ecommerce.controller;

import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @GetMapping("/home")
    public String homePage(Model model) {

        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);

        return "home";
    }

    @GetMapping("/")
    public String root() {
        return "redirect:/home";
    }


}
