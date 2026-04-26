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

    // Login logic - යූසර්ව පරීක්ෂා කිරීම
    public User login(String username, String password) {
        return userRepository.findByUsername(username)
                .filter(user -> user.getPassword().equals(password))
                .orElse(null); // යූසර් නැත්නම් හෝ පාස්වර්ඩ් වැරදි නම් null ලබා දෙයි
    }

    // Create - අලුත් පරිශීලකයෙකු සේව් කිරීම
    public void saveUser(User user) {
        userRepository.save(user);
    }

    // Read - සියලුම පරිශීලකයන් ලබා ගැනීම
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // Read - ID එක මගින් සෙවීම
    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    // Delete - පරිශීලකයෙකු ඉවත් කිරීම
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
}