package org.example.database_system.Controller;

import org.example.database_system.Service.SongService;
import org.example.database_system.entity.Song;
import org.example.database_system.entity.UserFavoriteDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/songs")
@CrossOrigin(origins = "*")
public class SongController {
    
    @Autowired
    private SongService songService;
    
    @GetMapping("/search")
    public List<Song> searchSongs(@RequestParam String keyword) {
        return songService.searchSongs(keyword);
    }
    
    @GetMapping
    public List<Song> getAllSongs() {
        return songService.getAllSongs();
    }
    
    @GetMapping("/{id}")
    public Song getSongDetails(@PathVariable Integer id) {
        return songService.getSongDetails(id);
    }
    
    @PostMapping("/{id}/play")
    public ResponseEntity<?> playSong(@PathVariable Integer id) {
        try {
            songService.updatePlayCount(id);
            return ResponseEntity.ok().body(Map.of("message", "播放次数更新成功"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
    
    @PostMapping("/add")
    public ResponseEntity<?> addSong(@RequestBody Map<String, String> request) {
        try {
            String title = request.get("title");
            String artistName = request.get("artistName");

            if (title == null || artistName == null) {
               return ResponseEntity.badRequest().body(Map.of("error", "歌曲名和艺术家名不能为空"));
            }
            
            songService.addSong(title, artistName);
            return ResponseEntity.ok().body(Map.of("message", "歌曲添加成功"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
    
    @PostMapping("/add/direct")
    public ResponseEntity<?> addSongDirect(@RequestBody Song song) {
        try {
            songService.addSongDirect(song);
            return ResponseEntity.ok().body(Map.of("message", "歌曲添加成功"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
    
    @PostMapping("/{id}/favorite")
    public ResponseEntity<?> toggleFavorite(@PathVariable Integer id, @RequestParam Integer userId) {
        try {
            songService.toggleFavorite(id, userId);
            return ResponseEntity.ok().body(Map.of("message", "收藏状态更新成功"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
    
    @GetMapping("/favorites")
    public List<UserFavoriteDetail> getUserFavorites(@RequestParam Integer userId) {
        return songService.getUserFavorites(userId);
    }
    
    @GetMapping("/{id}/favorite")
    public boolean checkFavorite(@PathVariable Integer id, @RequestParam Integer userId) {
        return songService.checkFavorite(userId, id);
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteSong(@PathVariable Integer id) {
        try {
            songService.deleteSong(id);
            return ResponseEntity.ok().body(Map.of("message", "歌曲删除成功"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
}
