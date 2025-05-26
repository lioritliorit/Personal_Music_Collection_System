package org.example.database_system.entity;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class User {
    private Integer id;
    private String username;
    private String password;
    private String email;
    private LocalDateTime createdAt;

    public User(Integer userId) {
        this.id = userId;
    }

    public User() {
    }
}
