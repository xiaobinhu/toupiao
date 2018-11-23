package com.baizhi.spring.dao;
import com.baizhi.spring.entity.User;

public interface UserDao {
    public User login(User user); 
	
	public void reg(User user);
}
