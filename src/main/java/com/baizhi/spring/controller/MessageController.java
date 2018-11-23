package com.baizhi.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baizhi.spring.entity.Message;
import com.baizhi.spring.entity.Option;
import com.baizhi.spring.service.MessageService;
import com.baizhi.spring.service.OptionService;
import com.baizhi.spring.service.SubjectService;

@Controller
public class MessageController {
  @Autowired
  private MessageService messageService;
  
  @Autowired
  private OptionService optionService;
  
  @Autowired
  
  private SubjectService subjectService;
  @RequestMapping("selectBy")
  public @ResponseBody Map selectBy(int page,int rows,String title){
	Map map = messageService.selectBy(page, rows, title);
	return map;  
  }
  
  @RequestMapping("toupiao")
  public @ResponseBody Map toPiao(int id){
	  
	  //投票页面数据展示
	  System.out.println("++++++++++++++++++++++++++++");
	 /* Map map =new HashMap();
	 Message message = messageService.selectByid(id);
	 List<Option> list = optionService.selectAll(id);
	 int type = subjectService.selectType(id);
	 map.put("vs_type", type) ;
	 map.put("message", message);
	 map.put("list", list);*/
	  Map map =messageService.selectByid(id);
	 return map;
	  
  }
  
  @RequestMapping("option")
  public @ResponseBody Map option(int sid){
	  
	  System.out.println("-------------------------");
	  Map map =optionService.selectAll(sid);
	  
/*	   Map map =new HashMap();  
	   List<Option> list =optionService.selectAll(sid);
	  map.put("list1", list);*/
	  return map;
  }
  
  
  @RequestMapping("type")
  public @ResponseBody Map type(int sid){
/*	  Map map =new HashMap();
	  int type = subjectService.selectType(sid);
	  map.put("type",type);*/
	  Map map = subjectService.selectType(sid);
      return map;
  }
  
}
