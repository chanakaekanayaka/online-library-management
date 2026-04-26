package com.chanaka.library_management.controller;

import com.chanaka.library_management.model.User;
import com.chanaka.library_management.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    // ලියාපදිංචි වීමේ පිටුව පෙන්වීමට [cite: 52]
    @GetMapping("/register")
    public String showRegistrationPage() {
        return "register"; 
    }

    // ලියාපදිංචි දත්ත සේව් කිරීමට [cite: 47]
    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user) {
        userService.saveUser(user);
        return "redirect:/login"; 
    }

    // ලොගින් පිටුව පෙන්වීමට [cite: 53]
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    // ඇඩ්මින්ට සියලුම යූසර්ලා පෙන්වීමට [cite: 55]
    @GetMapping("/users")
    public String viewUsers(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "user-list";
    }

    // යූසර් කෙනෙකු මැකීමට [cite: 50]
    @GetMapping("/deleteUser/{id}")
    public String deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return "redirect:/users";
    }
}