package org.example.database_system.Controller;

import org.example.database_system.Service.AlbumService;
import org.example.database_system.entity.Artist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/albums")
public class AlbumController {
    
    @Autowired
    private AlbumService albumService;
    
    @GetMapping("/{id}")
    public ResponseEntity<?> getArtistDetails(@PathVariable Integer id) {
        Artist artist = albumService.getArtistDetails(id);
        return ResponseEntity.ok(artist);
    }
} 