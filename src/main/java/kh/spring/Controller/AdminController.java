package kh.spring.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Pagination;
import kh.spring.Service.AdminService;
import kh.spring.Service.MypageService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private AdminService aServ;
	
	@Autowired
	private MypageService mpServ;
	
	@Autowired
	HttpSession session;

	@Autowired
	Gson g;
	
	//관리자 메인 페이지
	@RequestMapping("adminMain")
	public String adminMemberList() {
		return "admin/adminMain";
	}
	
	//관리자 메인 페이지 : 회원정보 리스트 뽑기
	@ResponseBody
	@RequestMapping("memberList")
	public String memberList(Pagination page,String nowPage,String targetType,String target) {
		int cntPerPage = 10;//	한 페이지 당 회원 수
		int cntPage = 5;// 한바닥 당 페이지 수
	

		int total = aServ.selectMemberCount(targetType,target); //조건에 따른 멤버 수 뽑기
		page = new Pagination(total,Integer.parseInt(nowPage),cntPerPage,cntPage); // 페이지 정보
		List<MemberDTO> mList = aServ.memberListByPage(page,targetType,target); // 페이지, 조건에 따른 회원 리스트 뽑기
		List<Map<String,String>> rNcCountList = aServ.rNcCountList(mList); // 뽑힌 멤버에 따른 신고수, 개설 강의수 뽑기
			
		//뽑아낸 정보 JsonArray에 담기
		JsonArray jarr = new JsonArray();
		
		jarr.add(g.toJson(mList));
		jarr.add(g.toJson(rNcCountList));
		jarr.add(g.toJson(page));
		jarr.add(g.toJson(total));
		
		return g.toJson(jarr);
	}
	
	
	//회원정보 상세 페이지
	@RequestMapping("memberPage")
	public String memberPage(Model model,String email) {
		MemberDTO mdto = mpServ.select(email);//회원 리스트 뽑기
		if(mdto.getType().equals("M")) {//회원 등급에 따른 한글 변환
			mdto.setType("일반회원");
		}else if(mdto.getType().equals("B")) {
			mdto.setType("블랙리스트");
		}else {
			mdto.setType("관리자");
		}	
		
		int reportCount = aServ.reportCount(email); //회원 신고수 뽑기
		
		model.addAttribute("mdto",mdto);//회원 리스트 넣기
		model.addAttribute("reportCount",reportCount);
		return "/admin/adminMemberPage";
	}
	
	//회원정보 수정
	@ResponseBody
	@RequestMapping("memberUpdate")
	public void memberUpdate(String modiType,String modiContents,String email) {
		aServ.adminMemberUpdate(modiType,modiContents,email);
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

