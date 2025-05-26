package org.example.database_system.mapper;

import org.apache.ibatis.annotations.*;
import org.example.database_system.entity.UserFavorite;

@Mapper
public interface UserFavoriteMapper {
    
    @Select("SELECT * FROM user_favorites WHERE user_id = #{userId} AND song_id = #{songId}")
    UserFavorite findByUserIdAndSongId(Integer userId, Integer songId);
    
    @Insert("INSERT INTO user_favorites (user_id, song_id, favorited_at) VALUES (#{userId}, #{songId}, NOW())")
    void insert(Integer userId, Integer songId);
    
    @Delete("DELETE FROM user_favorites WHERE user_id = #{userId} AND song_id = #{songId}")
    void delete(Integer userId, Integer songId);
} 