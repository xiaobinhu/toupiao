package com.baizhi.spring.service;

import com.baizhi.spring.entity.User;

public interface UserService {
    public User login(User user); 
    public void reg(User user);
}
