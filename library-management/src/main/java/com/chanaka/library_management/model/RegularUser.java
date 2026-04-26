package com.chanaka.library_management.model;

import jakarta.persistence.Entity;

@Entity
public class RegularUser extends User {
    private String membershipType; // සාමාන්‍ය යූසර්ට පමණක් ඇති විශේෂ ගුණාංගයක් 
}