-- 艺术家
INSERT INTO artists VALUES (101,'Christopher','丹麦'),(102,'ABBA','瑞典');

-- 专辑
INSERT INTO albums VALUES
                       (11,'Under the Surface','2019-02-22',101),
                       (12,'Told you so','2014-03-13',101),
                       (13,'Arrival','1976-10-11',102);

-- 歌曲
INSERT INTO songs VALUES
                      (1001,'Bad',190,9,'2025-04-08 17:00:01',11),
                      (1002,'Waterfall',188,3,'2025-04-08 17:07:35',12),
                      (1003,'Dancing Queen',230,5,'2025-04-08 17:07:44',13);

-- 用户
INSERT INTO users VALUES
                      (1,'小a','1','1@qq.com','2025-04-08 16:31:31'),
                      (2,'小b','2','2@qq.com','2025-04-08 16:42:31'),
                      (3,'小c','3','3@qq.com','2025-04-08 16:43:02');

-- 收藏
INSERT INTO user_favorites VALUES
                               (1,1001,'2023-04-08 17:00:42'),
                               (2,1002,'2025-01-08 17:03:59'),
                               (3,1003,'2022-04-08 17:06:57');