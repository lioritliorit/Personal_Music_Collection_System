-- 创建用户收藏详情的视图
CREATE OR REPLACE VIEW user_favorite_details AS
SELECT
    uf.user_id,
    u.username,
    s.song_id,
    s.title AS song_title,
    s.duration,
    s.play_count,
    a.name AS artist_name,
    a.country AS artist_nationality,
    al.title AS album_name,
    al.release_date AS album_release_date,
    uf.favorited_at AS favorite_date
FROM user_favorites uf
JOIN users u ON uf.user_id = u.user_id
JOIN songs s ON uf.song_id = s.song_id
JOIN albums al ON s.album_id = al.album_id
JOIN artists a ON al.artist_id = a.artist_id;

-- 创建更新播放次数的存储过程
DROP PROCEDURE IF EXISTS update_play_count;
DELIMITER //
CREATE PROCEDURE update_play_count(IN p_song_id INT)
BEGIN
    DECLARE song_exists INT;

    -- 检查歌曲是否存在
    SELECT COUNT(*) INTO song_exists FROM songs WHERE song_id = p_song_id;

    IF song_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '歌曲不存在';
    END IF;

    -- 更新播放次数
    UPDATE songs s
    JOIN albums al ON s.album_id = al.album_id
    SET s.play_count = s.play_count + 1
    WHERE s.song_id = p_song_id;
END //
DELIMITER ;

-- 创建添加歌曲的触发器
DROP TRIGGER IF EXISTS before_song_insert;
DELIMITER //
CREATE TRIGGER before_song_insert
BEFORE INSERT ON songs
FOR EACH ROW
BEGIN
    -- 检查歌曲标题是否为空
    IF NEW.title IS NULL OR NEW.title = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '歌曲标题不能为空';
    END IF;

    -- 设置默认播放次数为0
    SET NEW.play_count = 0;

    -- 设置创建时间为当前时间
    SET NEW.created_at = NOW();
END //
DELIMITER ;
