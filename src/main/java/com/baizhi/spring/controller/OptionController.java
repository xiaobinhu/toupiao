package com.baizhi.spring.controller;

import com.baizhi.spring.entity.Item;
import com.baizhi.spring.entity.User;
import com.baizhi.spring.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class OptionController {
	
	@Autowired
     private ItemService itemService;
	

	
	@RequestMapping("addd")
	public @ResponseBody boolean addpiao(Item item,HttpSession httpSession,int[] oids){
			 User user=(User) httpSession.getAttribute("user");
			  String  uid = user.getVu_user_id();
			  
			  if(itemService.selectOne(uid, item.getVs_id(),oids)){
					  item.setVu_user_id(uid); 
					  itemService.insert(item, oids);
					  return true;
			  }else{
				      return false;
			  }
	}
}
