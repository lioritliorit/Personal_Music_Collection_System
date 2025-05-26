package org.example.database_system.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.database_system.entity.Artist;

@Mapper
public interface AlbumMapper {
    
    @Select("SELECT a.artist_id as id, a.name as name, a.country as country " +
            "FROM artists a " +
            "JOIN albums al ON a.artist_id = al.artist_id " +
            "JOIN songs s ON al.album_id = s.album_id " +
            "WHERE s.song_id = #{id}")
    Artist findById(Integer id);
} 