package com.baizhi.spring.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



import com.baizhi.spring.entity.OptionDto;
import com.baizhi.spring.entity.Subject;
import com.baizhi.spring.service.SubjectService;

@Controller
public class SubjectController {
  
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping("add")
	public @ResponseBody boolean addMang(Subject sb , OptionDto op){
		
		//System.out.println(op);
		try {
			subjectService.insert(sb,op);
			/*int id = sb.getVs_id();
			System.out.println(id);
			List<Option> list =op.getList();
			for(int i=0;i<list.size();i++){
				list.get(i).setVs_id(id);
				list.get(i).setVo_order(i);*/
			//}
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	@RequestMapping("guanli")
	public  @ResponseBody boolean guanli(int sid,OptionDto op,int[] delete,int vs_type){
		System.out.println(op);
		try {
			subjectService.guanli(sid, op,delete,vs_type);
			return true;
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}
		
	}
	
	
}
