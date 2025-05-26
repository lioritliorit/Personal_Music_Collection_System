package org.example.database_system.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class UserFavorite {
    private Integer userId;
    private Integer songId;
    private LocalDateTime favoritedAt;
}

