package kh.spring.Controller;

import java.sql.Timestamp;
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

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Pagination;
import kh.spring.DTO.RegStdsDTO;
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
		//회원정보
		MemberDTO mdto = mpServ.select(email);//회원 리스트 뽑기
		if(mdto.getType().equals("M")) {//회원 등급에 따른 한글 변환
			mdto.setType("일반회원");
		}else if(mdto.getType().equals("B")) {
			mdto.setType("블랙리스트");
		}else {
			mdto.setType("관리자");
		}	
		int reportCount = aServ.reportCount(email); //회원 신고수 뽑기
		//클래스
		List<ClassDTO> buycList = aServ.buyClass(email); //회원 구매 클래스 보기
		List<Timestamp> buydayList = aServ.buydayList(email); //클래스 구매일	
		List<ImgDTO> mainImgList = aServ.selectMainImgBySeq(buycList);//클래스 메인이미지
		

		model.addAttribute("mdto",mdto);//회원 리스트 넣기
		model.addAttribute("reportCount",reportCount);//회원 신고수
		model.addAttribute("buycList",buycList);//구매 클래스
		model.addAttribute("buydayList",buydayList);//클래스 구매일
		model.addAttribute("mainImgList",mainImgList);//클래스 메인 이미지
		return "/admin/adminMemberPage";
	}
	
	//회원정보 수정
	@ResponseBody
	@RequestMapping("memberUpdate")
	public void memberUpdate(String modiType,String modiContents,String email) {
		aServ.adminMemberUpdate(modiType,modiContents,email);
	}
	
	//회원탈퇴
	@RequestMapping("memberOut")
	public String memberOut(String email) throws Exception {
		System.out.println(email);
		mpServ.delete(email);
		return "/admin/adminMain";
	}

	
	@RequestMapping("memberClass")
	public String memberClass(Model model,String email) {
		model.addAttribute("email",email);
		return "/admin/adminMemberClass";
	}
	
	@ResponseBody
	@RequestMapping("buyClassList")
	public String buyClassList(String email,int nowPage) {
		
		int buyCountTotal = aServ.buyCountByEmail(email); //해당 회원의 전체 구매 클래스 수
		Pagination page = new Pagination(buyCountTotal,nowPage,5,5);//페이지네이션		
		List<ClassDTO> buyClassList = aServ.buyClassListByPage(email,page.getStart(),page.getEnd());
		
		
		return "OK";
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

