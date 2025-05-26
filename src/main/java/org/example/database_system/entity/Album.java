package org.example.database_system.entity;

import lombok.Data;
import java.time.LocalDate;

@Data
public class Album {
    private Integer id;
    private String title;
    private LocalDate releaseDate;
    private Integer artistId;
}
