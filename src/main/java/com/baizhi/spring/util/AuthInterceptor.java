package com.baizhi.spring.util;

import com.baizhi.spring.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class AuthInterceptor implements HandlerInterceptor {



	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		//����¼���ܷ���
		HttpSession session = arg0.getSession();
		User user =(User) session.getAttribute("user");
		if(user!=null){
			//˵���Ѿ���¼������
			return true;
		}else{
			//String url = arg0.getRequestURI();
			//�ض��򵽵�¼ҳ��
			arg1.sendRedirect("login.jsp");
			return false;
		}
		
	}
	
	


	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}



	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
					throws Exception {
		
	}

}
