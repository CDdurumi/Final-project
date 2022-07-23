package kh.spring.Controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Pagination;
import kh.spring.DTO.ReportDTO;
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
	public String adminMemberList(Model model) {
		
		//대시보드
		//일별 로그인 수
		List<Map<String,String>> loginForWeek =aServ.loginForWeek();
		//일별 클래스 게시 수
		List<Map<String,String>> openForWeek =aServ.openForWeek();
		//일별 카테고리 별 강의 등록자 수 수
		List<Map<String,String>> regForWeek =aServ.regForWeek();
		//일별 게시글 등록 수
		List<Map<String,String>> writeForWeek =aServ.writeForWeek();
		//주간 카테고리별 게시글 등록 수
		List<Map<String,String>> writeByCate =aServ.writeByCate();
		//10일간 접속자
		List<Map<String,String>> loginFor10 =aServ.loginFor10();
		//10일간 가입자
		List<Map<String,String>> signFor10 =aServ.signFor10();
		//10일간 클래스
		List<Map<String,String>> classFor10 =aServ.classFor10();
		//10일간 게시글
		List<Map<String,String>> comuFor10 =aServ.comuFor10();
		//10일간 리뷰
		List<Map<String,String>> reviewFor10 =aServ.reviewFor10();
		//10일간 매출
		List<Map<String,String>> earnFor10 =aServ.earnFor10();
		//이번달 매출
		Map<String,String> earnThisMonth =aServ.earnThisMonth();
		

		//차트
		model.addAttribute("loginForWeek",loginForWeek);
		model.addAttribute("openForWeek",openForWeek);
		model.addAttribute("regForWeek",regForWeek);
		model.addAttribute("writeForWeek",writeForWeek);
		model.addAttribute("writeByCate",writeByCate);
		//표
		model.addAttribute("loginFor10",loginFor10);
		model.addAttribute("signFor10",signFor10);
		model.addAttribute("classFor10",classFor10);
		model.addAttribute("comuFor10",comuFor10);
		model.addAttribute("reviewFor10",reviewFor10);
		model.addAttribute("earnFor10",earnFor10);
		model.addAttribute("earnThisMonth",earnThisMonth);
		return "admin/adminMain";
	}
	
	//관리자 메인 페이지 : 회원정보 리스트 뽑기
	@ResponseBody
	@RequestMapping("memberList")
	public String memberList(Pagination page,String nowPage,String targetType,String target) {
//		int cntPerPage = 10;//	한 페이지 당 회원 수
//		int cntPage = 5;// 한바닥 당 페이지 수
	

		int total = aServ.selectMemberCount(targetType,target); //조건에 따른 멤버 수 뽑기
		page = new Pagination(total,Integer.parseInt(nowPage),10,5); // 페이지 정보
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
		List<Map<String,Object>> buycList = aServ.buyClassListByPage(email,1,3); //회원 구매 클래스 보기
		List<ImgDTO> mainImgList = aServ.selectClassMainImgBySeq2(buycList);//클래스 메인이미지
		
		//커뮤니티
		List<Map<String,String>> boardList = aServ.boardListByEmail(email,1,3);
		System.out.println("BOARDlIST" + boardList.size() );
		
		//댓글
		List<Map<String,String>> replyList = aServ.ReplyByEmail(email, 1,3); 
		System.out.println(replyList);
		model.addAttribute("mdto",mdto);//회원 리스트 넣기
		model.addAttribute("reportCount",reportCount);//회원 신고수
		model.addAttribute("buycList",buycList);//구매 클래스
		model.addAttribute("mainImgList",mainImgList);//클래스 메인 이미지
		model.addAttribute("boardList", boardList);//커뮤니티 리스트
		model.addAttribute("replyList", replyList);//커뮤니티 리스트
			return "/admin/adminMemberPage";
	}
	
	//회원정보 수정
	@ResponseBody
	@RequestMapping("memberUpdate")
	public void memberUpdate(String modiType,String modiContents,String email) {
		aServ.adminMemberUpdate(modiType,modiContents,email);
		MemberDTO mdto = mpServ.select(email);

		
	}
	
	
	//기본이미지로 바꾸기
	@ResponseBody
	@RequestMapping("imgToDefault")
	public void imgToDefault(String email) {
		mpServ.deleteImage(email);
	}
	
	
	//회원탈퇴
	@RequestMapping("memberOut")
	public String memberOut(String email) throws Exception {
		mpServ.delete(email);
		return "/admin/adminMain";
	}

	//멤버 클래스 홈페이지로
	@RequestMapping("memberClass")
	public String memberClass(Model model,String email) {
		
		MemberDTO mdto = mpServ.select(email);//구매한 클래스
		model.addAttribute("mdto",mdto);
		return "/admin/adminMemberClass";
	}
	
	//멤버 클래스 각 탭으로로
	@RequestMapping("memberClassTap1")
	public String memberClassTap1(Model model,String email) {

		MemberDTO mdto = mpServ.select(email);//구매한 클래스
		model.addAttribute("mdto",mdto);
		return "/admin/adminMemberClass";
	}
	
	//구매한 재능
	@ResponseBody
	@RequestMapping("buyClassList")
	public String buyClassList(String email,int nowPage) {
		
		int buyCountTotal = aServ.buyCountByEmail(email); //해당 회원의 전체 구매 클래스 수
		Pagination page = new Pagination(buyCountTotal,nowPage,5,5);//페이지네이션		
		List<Map<String,Object>> buyClassList = aServ.buyClassListByPage(email,page.getStart(),page.getEnd());//구매 클래스 불러오기
		List<String> class_date = aServ.class_dateToString2(buyClassList);
		List<ImgDTO> mainImgList = aServ.selectClassMainImgBySeq2(buyClassList);//클래스 메인이미지
		
		//뽑아낸 정보 JsonArray에 담기
		JsonArray jarr = new JsonArray();
		
		jarr.add(g.toJson(page));
		jarr.add(g.toJson(buyClassList));

		jarr.add(g.toJson(mainImgList));
		jarr.add(g.toJson(class_date));
//		jarr.add(g.toJson(nicknameList));
		
		return g.toJson(jarr);
	}	

	
	//좋아요한 클래스
	@ResponseBody
	@RequestMapping("goodClass")
	public String goodClass(String email, int nowPage){
		
		int goodClassCount = aServ.goodClassCount(email);//좋아요한 클래스 전체 수
		Pagination page = new Pagination(goodClassCount,nowPage,5,5);//페이지네이션	
		List<Map<String,Object>> goodCList = aServ.selectGoodClass(email,page.getStart(),page.getEnd());//좋아요한 클래스 리스트
		List<ImgDTO> mainImgList = aServ.selectClassMainImgBySeq2(goodCList);//클래스 메인이미지
		List<String> class_dateList = aServ.class_dateToString2(goodCList);//클래스 수업 날짜 뽑기(날짜 형식 때문에 따로 뽑음..)

		//뽑아낸 정보 JsonArray에 담기
		JsonArray jarr = new JsonArray();
		jarr.add(g.toJson(page));
		jarr.add(g.toJson(goodCList));
		jarr.add(g.toJson(mainImgList));
		jarr.add(g.toJson(class_dateList));
		
		return g.toJson(jarr);
	}
	
	//오픈한 재능
	@ResponseBody
	@RequestMapping("openClass")
	public String openClass(String email,int nowPage) {	
		int openClassCount = aServ.openClassCount(email);//등록한 전체 클래스 수
		Pagination page = new Pagination(openClassCount,nowPage,5,5);//페이지 정보
		List<Map<String,Object>> openCList = aServ.openCListByPage(email,page.getStart(),page.getEnd());
		List<ImgDTO> mainImgList = aServ.selectClassMainImgBySeq2(openCList);//클래스 메인이미지
		List<String> class_dateList = aServ.class_dateToString2(openCList);
		
		//뽑아낸 정보 JsonArray에 담기
		JsonArray jarr = new JsonArray();
		jarr.add(g.toJson(page));
		jarr.add(g.toJson(openCList));
		jarr.add(g.toJson(mainImgList));
		jarr.add(g.toJson(class_dateList));
		
		return g.toJson(jarr);
	}
	
	//작성한 리뷰
	@ResponseBody
	@RequestMapping("writeReview")
	public String writeReview(String email,int nowPage) {
		
		int reviewCountByEmail = aServ.reviewCountByEmail(email);//등록한 전체 클래스 수
		Pagination page = new Pagination(reviewCountByEmail,nowPage,5,5);//페이지 정보
		List<Map<String,Object>> reviewList = aServ.reviewListByPage(email,page.getStart(),page.getEnd());
		List<ImgDTO> mainImgList = aServ.selectClassMainImgBySeq2(reviewList);//클래스 메인이미지
		List<String> class_dateList = aServ.class_dateToString2(reviewList);
		//뽑아낸 정보 JsonArray에 담기
		
		
		JsonArray jarr = new JsonArray();
		jarr.add(g.toJson(page));
		jarr.add(g.toJson(reviewList));
		jarr.add(g.toJson(mainImgList));
		jarr.add(g.toJson(class_dateList));
		
		System.out.println(reviewList);
		
		return g.toJson(jarr);
	}
	
	
	//멤버 클래스 디테일
	@RequestMapping("memberClassDetail")
	public String memberClassDetail(String class_seq,Model model) {
//		System.out.println("백 도착?"+class_seq);
		Map<String,Object> classDetail = aServ.classDetail(class_seq);//클래스 정보(별점,수강인원,리뷰수,classDTO)
//		System.out.println("디테일 완료");
		List<Map<String,Object>> classStd = aServ.classStd(class_seq);//수강생 정보
		List<Map<String,Object>> classReview = aServ.classReview(class_seq);//리뷰 정보
		
		
		
		model.addAttribute("classDetail",classDetail);
		model.addAttribute("classStd",classStd);
		model.addAttribute("classReview",classReview);

		return "admin/memberClassDetail";
	}
	
	//멤버 구매 클래스 디테일
	@RequestMapping("buyClassDetail")
	public String buyClassDetail(Model model,String email,String regstds_seq) {
		Map<String,Object> classInfo = aServ.classInfoByEmailNSeq(regstds_seq);
		String emails = email;
		System.out.println("도착안함?"+email);
		model.addAttribute("classInfo",classInfo);
		model.addAttribute("usermail",emails);
		return "admin/buyClassDetail";
	}
	
	//해당 회원이 쓴 글
	@ResponseBody
	@RequestMapping("writtenBoard")
	public String writtenBoard(String email,int nowPage) {
		
		int boardCount = aServ.boardCountByEmail(email);
		Pagination page = new Pagination(boardCount,nowPage,5,5);
		List<Map<String,String>> boardList = aServ.boardListByEmail(email,page.getStart(),page.getEnd());
		List<String> mainImgList = aServ.selectComuMainImgBySeq(boardList);
		
		
		//뽑아낸 정보 JsonArray에 담기
		JsonArray jarr = new JsonArray();
		
		jarr.add(g.toJson(boardCount));
		jarr.add(g.toJson(page));
		jarr.add(g.toJson(boardList));
		jarr.add(g.toJson(mainImgList));
		
		return g.toJson(jarr);
	}
	
	//해당회원이 쓴 댓글
	@ResponseBody
	@RequestMapping("replyByEmail")
	public String replyByEmail(String email,int nowPage) {
	
		int replyCount = aServ.countReplyByEmail(email);
		Pagination page = new Pagination(replyCount,nowPage,5,5);
		List<Map<String,String>> replyList = aServ.ReplyByEmail(email, page.getStart(), page.getEnd()); 
		
		
		//뽑아낸 정보 JsonArray에 담기
		JsonArray jarr = new JsonArray();
		System.out.println("값이 없나?"+g.toJson(email));
		jarr.add(g.toJson(replyCount));
		jarr.add(g.toJson(page));
		jarr.add(g.toJson(replyList));
		System.out.println(jarr);
		
		return g.toJson(jarr);
		
	}
	
	//신고 리스트 출력
	@RequestMapping(value="reportList",method=RequestMethod.POST)
	@ResponseBody
	public String ReportList(@RequestParam Map<String, Object> param){
		
		int nowPage = Integer.parseInt( (String) param.get("nowPage"));
		int total = aServ.reportCoutnByCon(param); //조건에 따른 신고 수 뽑기
		Pagination page = new Pagination(total,nowPage,5,5);
		List<Map<String,String>> reportList = aServ.selectReportList(param,page.getStart(),page.getEnd());

		int notDeletedReport = aServ.notDeletedReport(param);//삭제 안된 리스트 뽑기
		List<String> boardNclass_seq = aServ.boardNclass_seq2(reportList);
		
		//뽑아낸 정보 JsonArray에 담기
		JsonArray jarr = new JsonArray();

		jarr.add(g.toJson(page));
		jarr.add(g.toJson(reportList));
		jarr.add(g.toJson(total));
		jarr.add(g.toJson(notDeletedReport));
		jarr.add(g.toJson(boardNclass_seq));
		
		return g.toJson(jarr);
	}
	
	
	//선택대상 반려하기
	@ResponseBody
	@RequestMapping(value="reportReject")
	public void reportReject(String rejectTarget) {
		String[] rtArr = rejectTarget.split(",");	
		aServ.reportReject(rtArr);
	}
	
	//선택대상 삭제하기
	@ResponseBody
	@RequestMapping("reportSelectDelete")
	public void reportSelectDelete(String rejectTarget) {
		String[] rtArr = rejectTarget.split(",");
		
		for(int i=0;i<rtArr.length;i++) {
			System.out.println(rtArr[i]);
		}
		aServ.reportSelectDelete(rtArr);
	}
	
	//전체 삭제하기
	@ResponseBody
	@RequestMapping(value="deleteAllReport",method=RequestMethod.POST)
	public void allDelete(@RequestParam Map<String, Object> param) {
		aServ.deleteAllReport(param);
	}
	
	//블랙리스트 뽑기
	@ResponseBody
	@RequestMapping(value="blackList",method=RequestMethod.POST)
	public String blackList(@RequestParam Map<String,Object> param) {
		
		int total = aServ.totalBlackListCount(param);//조건에 따른 블랙리스트 전체 인원 뽑기
		Pagination page = new Pagination(total,Integer.parseInt((String) param.get("nowPage")),10,5);//페이지네이션
		List<Map<String,String>> blackListMember = aServ.selectBlackListByPage(param,page.getStart(),page.getEnd()); //조건에 맞는 블랙리스트 멤버 정보 추출
		
		
		JsonArray jarr = new JsonArray();
		jarr.add(g.toJson(page));
		jarr.add(g.toJson(blackListMember));
		jarr.add(g.toJson(total));
		
		return g.toJson(jarr);
	}
	
	
	//블랙리스트 해제
	@ResponseBody
	@RequestMapping("cancelBlackList")
	public void cancelBlackList(String cancelTarget) {
		
		String[] barr = cancelTarget.split(","); //해제 대상 이메일 추출
		
		aServ.cancelBlackList(barr);
	}
	
	//블랙리스트 등록
	@ResponseBody
	@RequestMapping("regBlackList")
	public void regBlackList(String regTarget) {
		
		String[] barr = regTarget.split(","); //해제 대상 이메일 추출
		
		aServ.regBlackList(barr);
	}
	
	//블랙리스트 멤버 정보(신고현황포함)
	@RequestMapping("memberReport")
	public String memberReport(String email,Model model){
		System.out.println("멜 도착?"+ email);
		Map<String,String> blackMember = aServ.memberInfoByEmail(email);//이메일로 회원정보 불러오기(반려수, 신고 수 있음)
		Map<String,String> reportCount = aServ.reportCountByCategoty(email);//게시물,리뷰,댓글에 따라 신고수
		List<ReportDTO> rList = aServ.reportByEmail(email,0,0);//회원에 따른 신고 리스트
		List<Map<String,String>> writerNreporter = aServ.selectNameNick(rList);
		List<String> boardNclass_seq = aServ.boardNclass_seq(rList);
		List<String> locations = aServ.locationOfReport(rList);

		model.addAttribute("blackMember",blackMember);
		model.addAttribute("reportCount",reportCount);
		model.addAttribute("rList",rList);
		model.addAttribute("writerNreporter",writerNreporter);
		model.addAttribute("boardNclass_seq", boardNclass_seq);
		model.addAttribute("locations",locations);
		return "/admin/adminBlackListMember";
	}
	
	
	//블랙리스트 멤버 상세 현황
	@RequestMapping("memberReportList")
	public String memberReportList(String email,String nowPage,Model model){
		Map<String,String> blackMember = aServ.memberInfoByEmail(email);//이메일로 회원정보 불러오기(반려수, 신고 수 있음)
		Map<String,String> reportCount = aServ.reportCountByCategoty(email);//게시물,리뷰,댓글에 따라 신고수;
		 int total = Integer.parseInt(String.valueOf(blackMember.get("REJECT")))+Integer.parseInt(String.valueOf(blackMember.get("REPORT")));
		Pagination page = new Pagination(total,Integer.parseInt(nowPage),5,5);
		List<ReportDTO> rList = aServ.reportByEmail(email,page.getStart(),page.getEnd());//회원에 따른 신고 리스트
		List<Map<String,String>> writerNreporter = aServ.selectNameNick(rList);
		List<String> boardNclass_seq = aServ.boardNclass_seq(rList);
		List<String> locations = aServ.locationOfReport(rList);
		
		
		model.addAttribute("blackMember",blackMember);
		model.addAttribute("reportCount",reportCount);
		model.addAttribute("rList",rList);
		model.addAttribute("writerNreporter",writerNreporter);
		model.addAttribute("boardNclass_seq", boardNclass_seq);
		model.addAttribute("page", page);
		model.addAttribute("locations",locations);
		return "/admin/adminBlackListMemberDetail";
	}
	
	
	
	@RequestMapping("memberCommunity")
	public String memberCommunity(String email,Model model) {
		
		MemberDTO mdto = mpServ.select(email);
		
		model.addAttribute("mdto",mdto);
		
		return "/admin/adminMemberCommunity";
	}
	

	//이메일로 신고 삭제 처리
	@ResponseBody
	@RequestMapping("deleteAllbyEmail")
	public void deleteAllbyEmail(String email) {
		aServ.deleteAllReportByEmail(email);
	}
	
	
	//대시보드
	@ResponseBody
	@RequestMapping("dashBord")
	public String dashBoard() {
		return "gksl";
	}
	
	
//	@RequestMapping("dumDate")
//	public String dumDate(){
//		
//		aServ.dumDate();;
//		
//		return "redirect:/admin/adminMain";
//	}
}

