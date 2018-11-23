package com.baizhi.spring.dao;

import java.util.List;



import org.apache.ibatis.annotations.Param;

import com.baizhi.spring.entity.Message;
import com.baizhi.spring.entity.User;

public interface MessageDao {
	public List<Message> selectBy(@Param("start") int start, @Param("end") int end, @Param("title") String title);
	public int count(@Param("title") String title);
	public Message selectByid(int vs_id);
}
