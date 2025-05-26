package org.example.database_system.Service;

import org.example.database_system.entity.User;
import org.example.database_system.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
    
    @Autowired
    private UserMapper userMapper;
    
    @Transactional
    public User login(String username, String password, String email) {
        User user = userMapper.findByUsername(username);
        if (user == null) {
            throw new RuntimeException("用户不存在");
        }
        if (!user.getPassword().equals(password)) {
            throw new RuntimeException("密码错误");
        }
        if (!user.getEmail().equals(email)) {
            throw new RuntimeException("邮箱错误");
        }
        return user;
    }
} 