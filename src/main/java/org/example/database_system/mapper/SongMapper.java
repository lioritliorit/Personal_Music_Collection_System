package org.example.database_system.mapper;

import org.apache.ibatis.annotations.*;
import org.example.database_system.entity.Song;
import org.example.database_system.entity.Artist;
import org.example.database_system.entity.Album;
import org.example.database_system.entity.UserFavorite;
import org.example.database_system.entity.UserFavoriteDetail;

import java.util.List;

@Mapper
public interface SongMapper {
    
    @Select("SELECT s.song_id as id, s.title, s.duration, s.play_count as playCount, " +
            "s.created_at as createdAt, s.album_id as albumId, " +
            "a.name as artistName, a.country as artistCountry, " +
            "al.title as albumTitle, al.release_date as albumReleaseDate " +
            "FROM songs s " +
            "JOIN albums al ON s.album_id = al.album_id " +
            "JOIN artists a ON al.artist_id = a.artist_id " +
            "WHERE s.title LIKE CONCAT('%', #{keyword}, '%') " +
            "OR a.name LIKE CONCAT('%', #{keyword}, '%')")
    List<Song> searchSongs(@Param("keyword") String keyword);
    
    @Select("SELECT s.song_id as id, s.title, s.duration, s.play_count as playCount, " +
            "s.created_at as createdAt, s.album_id as albumId, " +
            "a.name as artistName, a.country as artistCountry, " +
            "al.title as albumTitle, al.release_date as albumReleaseDate " +
            "FROM songs s " +
            "JOIN albums al ON s.album_id = al.album_id " +
            "JOIN artists a ON al.artist_id = a.artist_id")
    List<Song> findAll();
    
    @Select("SELECT s.song_id as id, s.title, s.duration, s.play_count as playCount, " +
            "s.created_at as createdAt, s.album_id as albumId, " +
            "a.name as artistName, a.country as artistCountry, " +
            "al.title as albumTitle, al.release_date as albumReleaseDate " +
            "FROM songs s " +
            "JOIN albums al ON s.album_id = al.album_id " +
            "JOIN artists a ON al.artist_id = a.artist_id " +
            "WHERE s.song_id = #{id}")
    Song findById(@Param("id") Integer id);
    
    @Insert("INSERT INTO artists (name, country) VALUES (#{name}, #{country})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void addArtist(Artist artist);
    
    @Insert("INSERT INTO albums (title, release_date, artist_id) VALUES (#{title}, #{releaseDate}, #{artistId})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void addAlbum(Album album);
    
    @Insert("INSERT INTO songs (title, duration, album_id, play_count) VALUES (#{title}, #{duration}, #{albumId}, #{playCount})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void addSong(Song song);
    
    @Update("CALL update_play_count(#{songId})")
    void updatePlayCount(@Param("songId") Integer songId);
    
    @Select("SELECT user_id as userId, username, song_id as songId, song_title as songTitle, " +
            "duration, play_count as playCount, artist_name as artistName, " +
            "artist_nationality as artistNationality, album_name as albumName, " +
            "album_release_date as albumReleaseDate, favorite_date as favoriteDate " +
            "FROM user_favorite_details WHERE user_id = #{userId}")
    List<UserFavoriteDetail> findUserFavorites(@Param("userId") Integer userId);

    @Select("SELECT COUNT(*) FROM user_favorites WHERE user_id = #{userId} AND song_id = #{songId}")
    boolean checkFavorite(@Param("userId") Integer userId, @Param("songId") Integer songId);

    @Insert("INSERT INTO user_favorites (user_id, song_id) VALUES (#{userId}, #{songId})")
    void insertFavorite(@Param("userId") Integer userId, @Param("songId") Integer songId);

    @Delete("DELETE FROM user_favorites WHERE user_id = #{userId} AND song_id = #{songId}")
    void deleteFavorite(@Param("userId") Integer userId, @Param("songId") Integer songId);

    @Delete("DELETE s, uf FROM songs s " +
            "LEFT JOIN user_favorites uf ON s.song_id = uf.song_id " +
            "WHERE s.song_id = #{songId}")
    void deleteSong(@Param("songId") Integer songId);
}
