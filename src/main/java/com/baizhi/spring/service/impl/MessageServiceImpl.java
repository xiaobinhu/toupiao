package com.baizhi.spring.service.impl;

import com.baizhi.spring.dao.MessageDao;
import com.baizhi.spring.dao.OptionDao;
import com.baizhi.spring.dao.SubjectDao;
import com.baizhi.spring.entity.Message;
import com.baizhi.spring.entity.Option;
import com.baizhi.spring.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Transactional
@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
    private MessageDao messageDao;
	@Autowired
	private OptionDao optionDao;
	@Autowired
	private SubjectDao subjectDao;
	

	public Map selectBy(int page, int rows, String title) {
		  Map map = new HashMap();
		  int start =(page-1)*rows+1;
		  int end =page*rows;
		  if(title!=null&&title!=""){
			  title="%"+title+"%";	
			}else{
				title=null;	
			}
		  List<Message> list =messageDao.selectBy(start, end, title);
		  int total =messageDao.count(title);
		  map.put("rows", list);
		  map.put("total", total);
		return map;
	}


	public Map selectByid(int id) {
		
		Map map = new HashMap();
		Message message =messageDao.selectByid(id);
		 //Message message = messageService.selectByid(id);
		 List<Option> list = optionDao.selectByid(id);
		 int type = subjectDao.selectType(id);
		 map.put("vs_type", type) ;
		 map.put("message", message);
		 map.put("list", list);
		return map;
	}
}
