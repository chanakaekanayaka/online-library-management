package com.chanaka.library_management.controller;

import com.chanaka.library_management.model.AdminUser;
import com.chanaka.library_management.model.RegularUser;
import com.chanaka.library_management.model.User;
import com.chanaka.library_management.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // --- HOME PAGE ---
    @GetMapping("/")
    public String showHomePage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            model.addAttribute("user", user);
            return "home";
        }
        return "redirect:/login";
    }

    // --- LOGIN ---
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String username, @RequestParam String password, HttpSession session) {
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("loggedInUser", user);
            if ("ADMIN".equalsIgnoreCase(user.getUserType())) {
                return "redirect:/admin/dashboard";
            }
            return "redirect:/";
        }
        return "redirect:/login?error=true";
    }

    // --- REGISTER ---
    @GetMapping("/register")
    public String showRegistrationPage() {
        return "register"; 
    }

    @PostMapping("/register")
    public String registerUser(@RequestParam String username,
                               @RequestParam String email,
                               @RequestParam String password) {
        RegularUser regular = new RegularUser();
        regular.setUsername(username);
        regular.setEmail(email);
        regular.setPassword(password);
        regular.setUserType("REGULAR");
        regular.setMembershipType("Silver Member");
        
        userService.saveUser(regular);
        return "redirect:/login"; 
    }

    // --- ADMIN DASHBOARD ---
    @GetMapping("/admin/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"ADMIN".equalsIgnoreCase(user.getUserType())) {
            return "redirect:/login";
        }
        model.addAttribute("user", user);
        return "admin-dashboard";
    }

    @GetMapping("/admin/users")
    public String viewAllUsers(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"ADMIN".equalsIgnoreCase(user.getUserType())) {
            return "redirect:/login";
        }
        model.addAttribute("users", userService.getAllUsers());
        return "user-list";
    }

    // --- PROFILE VIEW ---
    @GetMapping("/profile/{id}")
    public String showProfile(@PathVariable Long id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "profile";
    }

    // ======================================================
    // --- මෙන්න මේ කොටස තමයි ඔයාට අඩු වෙලා තිබුණේ ---
    // ======================================================

    // 1. Edit Profile Page එක පෙන්වීම
    @GetMapping("/editMyProfile/{id}")
    public String showMyProfileEdit(@PathVariable Long id, Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        
        // ආරක්ෂාව සඳහා: ලොගින් වෙලා ඉන්න කෙනාට විතරයි තමන්ගේ profile එක edit කරන්න දෙන්නේ
        if (loggedInUser == null || !loggedInUser.getId().equals(id)) {
            return "redirect:/login";
        }
        
        User userToEdit = userService.getUserById(id);
        model.addAttribute("user", userToEdit);
        return "edit-my-profile"; // මෙහිදී 'edit-my-profile.jsp' file එක තිබිය යුතුයි
    }

    // 2. දත්ත Update කිරීමේ Logic එක
    @PostMapping("/updateMyProfile")
    public String updateMyProfile(@ModelAttribute User user, HttpSession session, RedirectAttributes redirectAttributes) {
        User existingUser = userService.getUserById(user.getId());
        
        if (existingUser != null) {
            existingUser.setUsername(user.getUsername());
            existingUser.setEmail(user.getEmail());
            existingUser.setPassword(user.getPassword());
            
            userService.saveUser(existingUser);
            
            // Session එකේ තියෙන user object එකත් update කරනවා (Navbar එකේ නම වෙනස් වීමට)
            session.setAttribute("loggedInUser", existingUser);
            
            redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully!");
        }
        
        return "redirect:/profile/" + user.getId();
    }
    
    // --- ADMIN LEVEL EDIT/DELETE (අත්‍යවශ්‍යයි) ---
    @GetMapping("/editUser/{id}")
    public String showEditPage(@PathVariable Long id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "edit-user";
    }

    @PostMapping("/updateUser")
    public String updateUser(@ModelAttribute User user, RedirectAttributes redirectAttributes) {
        User existingUser = userService.getUserById(user.getId());
        if (existingUser != null) {
            existingUser.setUsername(user.getUsername());
            existingUser.setEmail(user.getEmail());
            userService.saveUser(existingUser);
            redirectAttributes.addFlashAttribute("successMessage", "User updated successfully!");
        }
        return "redirect:/admin/users";
    }

    @GetMapping("/deleteUser/{id}")
    public String deleteUser(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        userService.deleteUser(id);
        redirectAttributes.addFlashAttribute("successMessage", "User deleted successfully!");
        return "redirect:/admin/users";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}