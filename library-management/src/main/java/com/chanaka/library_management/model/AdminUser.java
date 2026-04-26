package com.chanaka.library_management.model;

import jakarta.persistence.Entity;

@Entity
public class AdminUser extends User {
    private String adminLevel; // ඇඩ්මින්ට පමණක් ඇති විශේෂ ගුණාංගයක් [cite: 103]
}