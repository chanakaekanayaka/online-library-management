package com.chanaka.library_management.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.JOINED) // Inheritance සඳහා JOINED ක්‍රමය අත්‍යවශ්‍යයි [cite: 58-59]
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String username;
    private String email;
    private String password;
    private String userType; // මෙය "ADMIN" හෝ "REGULAR" විය යුතුය
}