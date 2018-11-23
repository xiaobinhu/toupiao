package com.baizhi.spring.service;

import java.util.List;
import java.util.Map;

import com.baizhi.spring.entity.Message;

public interface MessageService {
    public Map selectBy(int page, int rows, String title);
    
    public Map selectByid(int id);
}
