package com.chanaka.library_management.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.JOINED) // Inheritance සඳහා අත්‍යවශ්‍යයි 
@Data // Getter/Setter ඉබේම හදයි (Encapsulation) 
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String username;
    private String email;
    private String password;
    private String userType; // ADMIN හෝ REGULAR ලෙස වෙන් කිරීමට 
}