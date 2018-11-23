package com.baizhi.spring.service.impl;

import com.baizhi.spring.dao.OptionDao;
import com.baizhi.spring.entity.Option;
import com.baizhi.spring.service.OptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Transactional
@Service
public class OptionServiceImpl implements OptionService{
    @Autowired
	private OptionDao optionDao;
	

	public Map selectAll(int id) {
		 Map map = new HashMap();
		 List<Option> list =optionDao.selectByid(id);
		 map.put("list1", list);
		return  map;
				
	}
	

    
}
