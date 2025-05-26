package org.example.database_system.Service;

import org.example.database_system.entity.Artist;
import org.example.database_system.mapper.AlbumMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlbumService {
    
    @Autowired
    private AlbumMapper albumMapper;
    
    public Artist getArtistDetails(Integer id) {
        return albumMapper.findById(id);
    }
} 