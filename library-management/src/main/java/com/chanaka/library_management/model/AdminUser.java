package com.chanaka.library_management.model;

import jakarta.persistence.Entity;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "admin_user")
@PrimaryKeyJoinColumn(name = "id") // Parent ID එක සමඟ යා කරයි
@Data
@EqualsAndHashCode(callSuper = true) // Parent පන්තියේ variables (username, etc.) හඳුනා ගැනීමට
public class AdminUser extends User {
    private String adminLevel;
}