package org.example.database_system.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.database_system.entity.User;

@Mapper
public interface UserMapper {
    
    @Select("SELECT user_id as id, username, password, email, created_at as createdAt FROM users WHERE username = #{username}")
    User findByUsername(String username);
} 