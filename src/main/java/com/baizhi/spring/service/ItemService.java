package com.baizhi.spring.service;

import com.baizhi.spring.entity.Item;


public interface ItemService {
   
	public void insert(Item item, int[] ids);
	public boolean selectOne(String uid, int sid, int[] oid);
}
