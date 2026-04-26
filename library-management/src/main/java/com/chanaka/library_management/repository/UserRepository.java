package com.chanaka.library_management.repository;

import com.chanaka.library_management.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    // නම මගින් පරිශීලකයා සෙවීමට (Read Operation) [cite: 48]
    Optional<User> findByUsername(String username);
}