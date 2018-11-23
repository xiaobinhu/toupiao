package com.baizhi.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baizhi.spring.entity.User;
import com.baizhi.spring.service.UserService;

@Controller
public class UserController {
	@Autowired
  private UserService  userService;
	@RequestMapping("login")
	public String login(User user,HttpSession session){
		user =userService.login(user);
		   if(user!= null){
			   session.setAttribute("user", user);   
			   return "redirect:/showAll.jsp";
			   
		   }else{
			   return "redirect:/login.jsp";
		   }
		   
	}
	
	
	@RequestMapping("reg")
	public String reg(User user){
		userService.reg(user);
		return "redirect:/login.jsp";
	}
   	
 }
