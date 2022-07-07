package kh.spring.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Pagination;
import kh.spring.Service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private AdminService aServ;

	@Autowired
	HttpSession session;

	//관리자 메인 페이지
	@RequestMapping("adminMain")
	public String adminMemberList(Pagination page,Model m,@RequestParam(value="nowPage",required=false)String nowPage) {
		//1. 첫번째 페이지(회원 정보)
		//	1) 회원정보 페이징 처리
		//	전체 게시글 수 
		int total = aServ.selectAllMemberCount();
		// 현재 페이지, 처음 띄운 경우 1페이지로 가기
		if(nowPage==null) {
			nowPage="1";}
		//	한 페이지 당 회원 수
		int cntPerPage = 10;
		// 한바닥 당 페이지 수
		int cntPage = 5;

		page = new Pagination(total,Integer.parseInt(nowPage),cntPerPage,cntPage);
		System.out.println("마지막 페이지 : "+page.getLastPage() + "시작페이지 : "+ page.getStartPage() +
				"끝페이지 : " + page.getEndPage() + "시작글과 끝 글 : " + page.getStart() +"," + page.getEnd()+
				",cntPerPage : "+ page.getCntPerPage()+", cntPage : "+page.getCntPage());
		//	2) 회원 리스트 뽑기
		List<MemberDTO> mList = aServ.selectMemberByPage(page);
		
		//	3) 신고 수와 개설 강의 수 뽑기
		//	신고수, 개설 강의 수 넣어줄 리스트 
		List<Map<String,Object>> rNcCountList = new ArrayList<Map<String,Object>>();

		for(MemberDTO dto:mList) {
			//신고 수 뽑기
			Map<String,Object> map = new HashMap<String,Object>();
			int reportCount = aServ.countReportById(dto.getEmail());
			map.put("reportCount", reportCount);

			//개설 강의 수 뽑기
			int openClassCount = aServ.CountOpenClassById(dto.getEmail());
			map.put("openClassCount", openClassCount);

			rNcCountList.add(map);	
		}



		//1. 첫번째 페이지 : 회원정보 데이터 담기
		m.addAttribute("page",page); //페이지
		m.addAttribute("mList",mList);//회원정보
		m.addAttribute("rNcCountList", rNcCountList);//신고수,개설강의수


		return "admin/adminMain";
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

//	@RequestMapping("dumDate")
//	public String dumDate(){
//		
//		aServ.dumDate();;
//		
//		return "redirect:/admin/adminMain";
//	}
}

