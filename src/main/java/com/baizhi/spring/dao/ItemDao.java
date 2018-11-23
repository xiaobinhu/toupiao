package com.baizhi.spring.dao;


import org.apache.ibatis.annotations.Param;

import com.baizhi.spring.entity.Item;


public interface ItemDao {
   
	public void insert(@Param("item") Item item, @Param("oids") int[] odis);
	public Item selectOne(@Param("uid") String uid, @Param("sid") int sid, @Param("oid") int oid);
	public Item selectOne1(@Param("uid") String uid, @Param("sid") int sid);
}
