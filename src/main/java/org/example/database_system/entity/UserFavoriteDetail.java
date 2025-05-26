package org.example.database_system.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class UserFavoriteDetail {
    private Integer userId;
    private String username;
    private Integer songId;
    private String songTitle;
    private Integer duration;
    private Integer playCount;
    private String artistName;
    private String artistNationality;
    private String albumName;
    private LocalDateTime albumReleaseDate;
    private LocalDateTime favoriteDate;
} 