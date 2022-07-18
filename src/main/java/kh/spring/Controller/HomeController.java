package kh.spring.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.spring.DAO.CommunityDAO;
import kh.spring.Service.ClassService;
import kh.spring.Service.CommunityService;


@Controller
public class HomeController {
	
	@Autowired
	private ClassService cServ;
	@Autowired
	private CommunityService coServ;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception{
		
		// 추천 클래스 보기(최신순 6개)
		List<Map<String,String>> clist = cServ.selectIndex();
		// 커뮤니티 카테고리 별 최신순(궁금해요, 도와주세요, 도와드려요, 일상 각 1개씩 총 4개)
		List<Map<String,Object>> coList = coServ.selectIndex();	

		model.addAttribute("clist", clist);
		model.addAttribute("coList", coList);
		
		return "index";
	}
	
	
	@RequestMapping("/guide")
	public String guide() throws Exception{
		
		return "/center/guide";
	}
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
