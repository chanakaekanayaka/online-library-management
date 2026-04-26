package com.chanaka.library_management.service;

import com.chanaka.library_management.model.User;
import com.chanaka.library_management.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    // Create - අලුත් පරිශීලකයෙකු සේව් කිරීම [cite: 47]
    public void saveUser(User user) {
        userRepository.save(user);
    }

    // Read - සියලුම පරිශීලකයන් ලබා ගැනීම (Admin View සඳහා) [cite: 55]
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // Read - ID එක මගින් සෙවීම [cite: 48]
    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    // Delete - පරිශීලකයෙකු ඉවත් කිරීම [cite: 50]
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
}