package com.baizhi.spring.service.impl;


import com.baizhi.spring.dao.MessageDao;
import com.baizhi.spring.dao.OptionDao;
import com.baizhi.spring.dao.SubjectDao;
import com.baizhi.spring.entity.Message;
import com.baizhi.spring.entity.Option;
import com.baizhi.spring.entity.OptionDto;
import com.baizhi.spring.entity.Subject;
import com.baizhi.spring.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Transactional
@Service
public class SubjectServiceImpl implements SubjectService{
@Autowired
 private SubjectDao subjectDao; 
@Autowired
 private OptionDao  optionDao;
@Autowired
private MessageDao messageDao;


public void insert(Subject sb,OptionDto op) {
	subjectDao.insert(sb);
	int id = sb.getVs_id();
	//System.out.println(id);
	List<Option> list =op.getList();
	for(int i=0;i<list.size();i++){
		list.get(i).setVs_id(id);
		list.get(i).setVo_order(i);
	}
	System.out.println(list);
	optionDao.insert(list);
  }




public Map selectType(int sid) {
	// TODO Auto-generated method stub
	
	  Map map =new HashMap();
	  int type = subjectDao.selectType(sid);
	  map.put("type",type);
	
	  return map;
}




public void guanli(int sid, OptionDto op,int[] ids,int vs_type) {
	Message message =messageDao.selectByid(sid);
	int count =optionDao.maxOrder(sid)+1;
	List<Option> list =op.getList();
	if(list!=null){
	for(int i=0;i<list.size();i++){
		list.get(i).setVs_id(sid);
		list.get(i).setVo_order(i+count);
	}
	  optionDao.insert(list);
}
	if(ids!=null){		
	optionDao.update(ids);		
	}
	subjectDao.updateType(sid, vs_type);
	
	
}




}
