package com.baizhi.spring.service;



import com.baizhi.spring.entity.OptionDto;
import com.baizhi.spring.entity.Subject;

import java.util.Map;

public interface SubjectService {
   
	public void insert(Subject sb, OptionDto op);
	public Map selectType(int sid);
	
	public void guanli(int sid, OptionDto op, int[] ids, int vs_type);
	
}
