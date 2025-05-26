package org.example.database_system.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Song {
    private Integer id;
    private String title;
    private Integer duration;
    private Integer playCount;
    private LocalDateTime createdAt;
    private Integer albumId;
    
    // 用于显示的信息
    private String artistName;
    private String artistCountry;
    private String albumTitle;
    private LocalDateTime albumReleaseDate;
}
