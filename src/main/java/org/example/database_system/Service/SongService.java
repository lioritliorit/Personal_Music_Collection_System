package org.example.database_system.Service;

import org.example.database_system.entity.*;
import org.example.database_system.mapper.SongMapper;
import org.example.database_system.mapper.UserFavoriteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class SongService {
    
    @Autowired
    private SongMapper songMapper;
    
    @Autowired
    private UserFavoriteMapper userFavoriteMapper;
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Autowired
    private MusicApiService musicApiService;
    
    public List<Song> searchSongs(String keyword) {
        return songMapper.searchSongs(keyword);
    }
    
    public List<Song> getAllSongs() {
        return songMapper.findAll();
    }
    
    public Song getSongDetails(Integer id) {
        return songMapper.findById(id);
    }
    
    @Transactional
    public void updatePlayCount(Integer id) {
        songMapper.updatePlayCount(id);
    }
    
    @Transactional
    public void toggleFavorite(Integer songId, Integer userId) {
        boolean isFavorite = songMapper.checkFavorite(userId, songId);
        if (isFavorite) {
            songMapper.deleteFavorite(userId, songId);
        } else {
            songMapper.insertFavorite(userId, songId);
        }
    }
    
    public List<UserFavoriteDetail> getUserFavorites(Integer userId) {
        return songMapper.findUserFavorites(userId);
    }
    
    public boolean checkFavorite(Integer userId, Integer songId) {
        return songMapper.checkFavorite(userId, songId);
    }
    
    @Transactional
    public void deleteSong(Integer songId) {
        // 删除歌曲及其收藏记录
        songMapper.deleteSong(songId);
    }
    
    @Transactional
    public void addSong(String title, String artistName) {
        // 搜索歌曲信息
        Map<String, Object> songInfo = musicApiService.searchSong(title, artistName);
        if (songInfo == null) {
            throw new RuntimeException("未找到歌曲信息");
        }
        
        // 添加艺术家
        Artist artist = new Artist();
        artist.setName((String) songInfo.get("artistName"));
        artist.setCountry((String) songInfo.get("artistCountry"));
        songMapper.addArtist(artist);
        
        // 添加专辑
        Album album = new Album();
        album.setTitle((String) songInfo.get("albumTitle"));
        try {
            // 将字符串日期转换为LocalDate
            String releaseDateStr = (String) songInfo.get("releaseDate");
            if (releaseDateStr != null && !releaseDateStr.isEmpty()) {
                LocalDate releaseDate = LocalDate.parse(releaseDateStr.substring(0, 10)); // 只取日期部分
                album.setReleaseDate(releaseDate);
            } else {
                album.setReleaseDate(LocalDate.now()); // 如果没有日期，使用当前日期
            }
        } catch (Exception e) {
            album.setReleaseDate(LocalDate.now()); // 如果日期解析失败，使用当前日期
        }
        album.setArtistId(artist.getId());
        songMapper.addAlbum(album);
        
        // 添加歌曲
        Song song = new Song();
        song.setTitle((String) songInfo.get("title"));
        song.setDuration((Integer) songInfo.get("duration"));
        song.setAlbumId(album.getId());
        song.setPlayCount(0);
        songMapper.addSong(song);
    }
    
    @Transactional
    public void addSongDirect(Song song) {
        songMapper.addSong(song);
    }
} 