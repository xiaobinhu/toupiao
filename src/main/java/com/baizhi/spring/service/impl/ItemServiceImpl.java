package com.baizhi.spring.service.impl;

import com.baizhi.spring.dao.ItemDao;
import com.baizhi.spring.dao.SubjectDao;
import com.baizhi.spring.entity.Item;
import com.baizhi.spring.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	private SubjectDao  subjectDao;
 	

	public void insert(Item item,int[] ids) {

		itemDao.insert(item,ids);
		
	}


	public boolean selectOne(String uid, int sid,int[] oid) {
		int type =subjectDao.selectType(sid);
		Item item =null;
		if(type==0){
			item=itemDao.selectOne1(uid, sid);
		}else{
			for(int i=0;i<oid.length;i++){
			   item =itemDao.selectOne(uid, sid,oid[i]);
		  }
		}
		if(item!=null){
			return false;	
		}else{
			return true;
		}
		
	}

}
