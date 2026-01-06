package com.ecommerce.controller;


import com.ecommerce.model.CartItem;
import com.ecommerce.model.Product;
import com.ecommerce.service.CartService;
import com.ecommerce.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CartService cartService;

    @PostMapping("/add")
    public String addToCart(@RequestParam("productId") int productId, HttpSession session) {

        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {

            Product product = productService.getProductById(productId);

            List<CartItem> sessionCart =
                    (List<CartItem>) session.getAttribute("SESSION_CART");

            if (sessionCart == null) {
                sessionCart = new ArrayList<>();
            }

            boolean productExists = false;

            for (CartItem item : sessionCart) {
                if (item.getProductId() == productId) {
                    item.setQuantity(item.getQuantity() + 1);
                    item.setTotalPrice(item.getQuantity() * item.getPrice());
                    productExists = true;
                    break;
                }
            }

            if (!productExists) {
                CartItem cartItem = new CartItem();
                cartItem.setProductId(product.getId());
                cartItem.setProductName(product.getName());
                cartItem.setPrice(product.getPrice());
                cartItem.setQuantity(1);
                cartItem.setImageUrl(product.getImageUrl());
                cartItem.setTotalPrice(product.getPrice());

                sessionCart.add(cartItem);
            }

            session.setAttribute("SESSION_CART", sessionCart);

        } else {
            CartItem item = new CartItem();
            item.setProductId(productId);
            item.setQuantity(1);
            cartService.addToCart(userId, item);
        }

        return "redirect:/cart";

    }

    @GetMapping
    public String viewCart(HttpSession session, Model model) {

        Integer userId = (Integer) session.getAttribute("userId");

        List<CartItem> cartItems;

        if (userId == null) {
            cartItems = (List<CartItem>) session.getAttribute("SESSION_CART");

            if (cartItems == null) {
                cartItems = new ArrayList<>();
            }

        } else {
            cartItems = cartService.getCartItems(userId);
        }

        double grandTotal = 0;
        for (CartItem item : cartItems) {
            grandTotal += item.getTotalPrice();
        }

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("grandTotal", grandTotal);

        return "cart/cart";
    }
}
