package kh.spring.Controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.spring.DTO.Pagination;
import kh.spring.Service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private AdminService aServ;

	@Autowired
	HttpSession session;

	@Autowired
	Gson g;
	
	//관리자 메인 페이지
	@RequestMapping("adminMain")
	public String adminMemberList() {
// 2. 두번째 페이지(신고목록)
//		
//		
//
//		//1. 첫번째 페이지 : 회원정보 데이터 담기
//		m.addAttribute("page",page); //페이지
//		m.addAttribute("mList",mList);//회원정보
//		m.addAttribute("rNcCountList", rNcCountList);//신고수,개설강의수
//

		return "admin/adminMain";
	}
	
	@ResponseBody
	@RequestMapping("memberList")
	public String memberList(Pagination page,int nowPage,String dataTarget,String target) {
		//	1) 회원정보 페이징 처리
		//	전체 게시글 수 
		int total = aServ.selectAllMemberCount();
		int cntPerPage = 10;//	한 페이지 당 회원 수
		int cntPage = 5;// 한바닥 당 페이지 수
		
		page = new Pagination(total,nowPage,cntPerPage,cntPage);
		//	2) 회원 리스트,신고수, 개설 강의 수 뽑기
		Map<String,String> map = aServ.memberListByPage(page);
		
		map.put("page", g.toJson(page));
	
		
		return g.toJson(map);
	}
	
//	//회원 검색
//	@ResponseBody
//	@RequestMapping("memberSearch")
//	public String memberSearch(String targetType, String target) {
//		
//		Map<String,String> map = aServ.searchMember(targetType,target);
//		
//		return "도착?";
//	}
//	
	@RequestMapping("memberPage")
	public String memberPage() {
		return "/admin/adminMemberPage";
	}

	@RequestMapping("memberClass")
	public String memberClass() {
		return "/admin/adminMemberClass";
	}

	@RequestMapping("memberCommunity")
	public String memberCommunity() {
		return "/admin/adminMemberCommunity";
	}
	@RequestMapping("memberReport")
	public String memberReport(){
		return "/admin/adminBlackListMember";
	}

	@RequestMapping("memberReportList")
	public String memberReportList(){
		return "/admin/adminBlackListMemberDetail";
	}
	
	

//	@RequestMapping("dumDate")
//	public String dumDate(){
//		
//		aServ.dumDate();;
//		
//		return "redirect:/admin/adminMain";
//	}
}

