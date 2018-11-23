package com.baizhi.spring.dao;

import org.apache.ibatis.annotations.Param;

import com.baizhi.spring.entity.Subject;

public interface SubjectDao {
    public void insert(Subject sb);
	public int selectType(int sid);	
	public void updateType(@Param("sid") int sid, @Param("vs_type") int vs_type);
}
