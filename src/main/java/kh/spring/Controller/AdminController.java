package kh.spring.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.DTO.MemberDTO;
import kh.spring.Service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private AdminService aServ;
	
//	@Autowired
//	HttpSession session;
//	
	//관리자 메인 페이지
	@RequestMapping("adminMain")
	public String adminMemberList() {
		//1. 첫번째 페이지(회원 정보)
		//1) 회원 리스트 뽑기
		List<MemberDTO> mList = aServ.selectAllMember();
//		System.out.println(mList.get(0).getEmail());
		//2) 신고 수 뽑기 
//		String id = (String) session.getAttribute("loginID");
//		System.out.println(id);
////		int reportCount = aServ.countReportById();
//		
		return "/admin/adminMain";
	}

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

}

