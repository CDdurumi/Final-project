package kh.spring.Service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import kh.spring.DAO.AdminDAO;
import kh.spring.DAO.ImgDAO;
import kh.spring.DAO.MypageDAO;
import kh.spring.DAO.ReportDAO;
import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Pagination;
import kh.spring.DTO.ReportDTO;


@Service
public class AdminService {

	@Autowired
	AdminDAO adao;
	
	@Autowired
	ImgDAO idao;
	
	@Autowired
	ReportDAO rdao;
	
	@Autowired
	MypageDAO mdao;
	
	@Autowired
	Gson g;

	//1. 관리자 페이지 메인



	//회원리스트 뽑기
	public List<MemberDTO> memberListByPage(Pagination page,String targetType,String target){
		List<MemberDTO> mList = adao.selectMemberByPage(page,targetType,target);//회원정보
		for(MemberDTO mdto:mList) {
			if(mdto.getType().equals("M")) {
				mdto.setType("일반회원");
			}else if(mdto.getType().equals("B")) {
				mdto.setType("블랙리스트");
			}else {
				mdto.setType("관리자");
			}		
		}
		return  mList;
	}

	//신고수 및 등록강의수 뽑기
	public List<Map<String,String>> rNcCountList(List<MemberDTO> mList){

		List<Map<String,String>> rNcCountList = new ArrayList<Map<String,String>>();//신고수와 개설강의수 넣어줄 리스트
		for(MemberDTO dto:mList) {
			//신고 수 뽑기
			Map<String,String> map = new HashMap<String,String>();
			String reportCount = Integer.toString(adao.countReportById(dto.getEmail()));
			map.put("reportCount", reportCount);

			//개설 강의 수 뽑기
			String openClassCount = Integer.toString(adao.CountOpenClassById(dto.getEmail()));
			map.put("openClassCount", openClassCount);

			rNcCountList.add(map);	
		}

		return rNcCountList;
	}

	//  조건에 맞는 회원 수(페이징)
	public int selectMemberCount(String targetType,String target) {
		return adao.selectMemberCount(targetType,target);
	}
	
	//신고수 뽑기(회원상세페이지)
	public int reportCount(String email) {
		return adao.countReportById(email);
	}
	
	//회원정보 수정
	public void adminMemberUpdate(String modiType,String modiContents,String email) {
		adao.adminMemberUpdate(modiType,modiContents,email);
	}
	
	//메인 이미지 뽑기(클래스)
	public List<ImgDTO> selectClassMainImgBySeq1(List<ClassDTO> classList){
		
		List<ImgDTO> mainImgList = new ArrayList<ImgDTO>();
		
		for(ClassDTO cdto:classList) {
			ImgDTO idto =idao.selectMByPSeq(cdto.getClass_seq());
			mainImgList.add(idto);
		}
		
		return mainImgList;
	}
	
	//메인 이미지 뽑기(Map<String,Object>로)(클래스)
	public List<ImgDTO> selectClassMainImgBySeq2(List<Map<String,Object>> classList){
		
		List<ImgDTO> mainImgList = new ArrayList<ImgDTO>();
		
		for(Map<String,Object> map:classList) {
			ImgDTO idto =idao.selectMByPSeq((String) map.get("CLASS_SEQ"));
			mainImgList.add(idto);
		}
		
		return mainImgList;
	}
	
	
//		}

	//구매 날짜
	public List<Timestamp> buydayList(List<ClassDTO> buycList,String email){
		List<Timestamp> buydayList = new ArrayList<Timestamp>();
		
		for(ClassDTO rdto: buycList) {
			String buyday = adao.buydayBySeq(rdto.getClass_seq(),email);
			
			Timestamp timestamp = Timestamp.valueOf(buyday);
			
			buydayList.add(timestamp);
		}
		
		return buydayList;
	}
	
	//구매 클래스 수
	public int buyCountByEmail(String email) {
		return adao.buyCountByEmail(email);
	}
	
	//페이지 당 구매 리스트
	public List<Map<String,Object>> buyClassListByPage(String email,int start,int end){		
	return adao.buyClassListByPage(email,start,end);
		
	}
	
	//좋아요한 클래스 전체 수
	public int goodClassCount(String email) {
		return adao.goodClassCount(email);
	}
	
	
	//좋아요한 클래스
	public List<Map<String,Object>>  selectGoodClass(String email, int start, int end){
		return adao.selectGoodClass(email,start,end);
	}
	
	
	//오픈한 클래스 전체 수
	public int openClassCount(String email) {
		return adao.openClassCount(email); 
	}
	//오픈한 클래스
	public List<Map<String,Object>> openCListByPage(String email,int start,int end){
		List<Map<String,Object>> openCList =  adao.openCListByPage(email,start,end);
		for(Map<String,Object> map:openCList){
			if(map.get("STD_COUNT")==null) {
				map.put("STD_COUNT", "0");//카운트가 없을 경우 0으로!
			}
			if(map.get("REVIEW_COUNT")==null) {
				map.put("REVIEW_COUNT", "0");//카운트가 없을 경우 0으로!
			}
		}
		return openCList;
	}
	
	//멤버 클래스 디테일(ClassDTO,수강인원, 리뷰수, 평균 리뷰)
	public Map<String,Object> classDetail(String class_seq){
		return adao.classDetail(class_seq);
	}
	
	public List<Map<String,Object>> classStd(String class_seq){
		return adao.classStd(class_seq);
	}
	
	public List<Map<String,Object>> classReview(String class_seq){
		return adao.classReview(class_seq);
	}
	
	//구매 클래스 정보
	public Map<String,Object> classInfoByEmailNSeq(String regstds_seq){
		return adao.classInfoByEmailNSeq(regstds_seq);
	}
	

	//해당 회원이 작성한 리뷰 전체 수
	public int reviewCountByEmail(String email) {
		return adao.reviewCountByEmail(email);
	}
	
	//해당회원이 작성한 리뷰 리스트
	public List<Map<String,Object>> reviewListByPage(String email,int start,int end){
		return adao.reviewListByPage(email,start,end);
	}
	
	//해당 회원이 작성한 게시글 전체 수
	public int boardCountByEmail(String email) {
		return adao.boardCountByEmail(email);
	}
	
	//해당 회원이 작성한 게시글 리스트
	public List<Map<String, String>> boardListByEmail(String email,int start, int end){
		return adao.boardListByEmail(email,start,end);
	}
	
	//커뮤니티 메인이미지 뽑기
	public List<String> selectComuMainImgBySeq(List<Map<String,String>> boardList){
		
		return adao.selectComuMainImgBySeq(boardList);
	}
	
	public List<String> selectWrite_date(List<Map<String,String>> boardList){
		List<String> write_date = new ArrayList<String>();
		for(Map<String,String> map : boardList) {
			String date = adao.selectWrite_date(map.get("BOARD_SEQ"));
			write_date.add(date);
		}
		
		return write_date;
	}
	
	//날짜 변형하기
	public List<String> class_dateToString(List<ClassDTO> buyClassList){
		List<String> class_dateList = new ArrayList<String>();
		for(ClassDTO cdto:buyClassList) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        	//원하는 데이터 포맷 지정
			String strNowDate = simpleDateFormat.format(cdto.getClass_date()); 
        	//지정한 포맷으로 변환 
			class_dateList.add(strNowDate);
		}
		
		return class_dateList;
	}
	
	//날짜 변형하기(Map<String,Object>)
	public List<String> class_dateToString2(List<Map<String,Object>> classList){
		List<String> class_dateList = new ArrayList<String>();
		for(Map<String,Object> map:classList) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        	//원하는 데이터 포맷 지정
			String strNowDate = simpleDateFormat.format(map.get("CLASS_DATE")); 
        	//지정한 포맷으로 변환 
			class_dateList.add(strNowDate);
		}
		
		return class_dateList;
	}
	
	
	public List<String> selectNicknameByEmail(List<ClassDTO> buyClassList){
		List<String> nicknameList = new ArrayList<String>();
		
		for(ClassDTO cdto: buyClassList ) {
			String nickname = adao.selectNicknameByEmail(cdto.getCreater_id());
			nicknameList.add(nickname);
		}
		
		return nicknameList;
	}
	
	// 조건에 따른 신고 수 뽑기
	public int reportCoutnByCon(Map<String, Object> param) {
		return rdao.reportCoutnByCon(param);
	}
	
	
	//조건에 따른 신고 리스트 뽑기
	public List<Map<String, String>> selectReportList(Map<String,Object> param,int start,int end){
		
		List<Map<String, String>> selectReportList = rdao.selectReportList(param,start,end);
		
		for( Map<String, String> map: selectReportList) {
			String state = map.get("STATE");
			
			if(state.equals("0")) {
				map.put("STATE", "반려");
			}else if(state.equals("1")){
				map.put("STATE", "미처리");
			}else if(state.equals("2")){
				map.put("STATE", "삭제");
			}
		}
				
		return selectReportList;
	}
	
	// 삭제처리 안된 신고건 뽑기 (전체 삭제 수 뽑을 때 사용)
	public int notDeletedReport(Map<String, Object> param) {
		return rdao.notDeletedReport(param);
	}
	
	//이메일로 닉네임,이름 뽑기(신고리스트에 사용)
	public List<Map<String,String>> selectNameNick(List<ReportDTO> reportList){
		List<Map<String,String>> writerNreporter = new ArrayList<Map<String,String>>();
		Map<String,String> map = new HashMap<>();
		
		for(ReportDTO rdto:reportList) {
			//작성자
			MemberDTO mdtoForWriter = adao.selectMemberByEmail(rdto.getWriter());
				String writer = mdtoForWriter.getName() + "(" + mdtoForWriter.getNickname() +")";
			MemberDTO mdtoForReporter = adao.selectMemberByEmail(rdto.getReporter());
			String reporter =  mdtoForReporter.getName() + "(" + mdtoForReporter.getNickname() +")";
			map.put("writer", writer);
			map.put("reporter", reporter);
			writerNreporter.add(map);
		}
		
		return writerNreporter;
	}
	
	//신고 반려 기능
	public void reportReject(String[] rtArr) {
		rdao.reportToReject(rtArr);
	}
	
	//신고 선택 삭제 기능
	public void reportSelectDelete(String[] rtArr) {
		rdao.reportSelectDelete(rtArr);
	}
	
	//전체 삭제 기능
	public void deleteAllReport(Map<String, Object> param) {
		 rdao.deleteAllReport(param);
	}
	
	//댓글, 리뷰의 부모 seq 찾기
	public List<String> boardNclass_seq2(List<Map<String,String>> reportList){
		
		List<String> boardNclass_seq = new ArrayList<String>();
		
		for(Map<String,String> map : reportList) {
			String bc_seq = null;
			if(((String) map.get("PARENT_SEQ")).startsWith("cr")) {
				bc_seq = rdao.classSeqByReviewSeq(map.get("PARENT_SEQ"));
			}else if(map.get("PARENT_SEQ").startsWith("r")&&!map.get("PARENT_SEQ").startsWith("rr")) {
				bc_seq = rdao.boardSeqByReplySeq(map.get("PARENT_SEQ"));
			}
			else{
				bc_seq = "non";
			}
				
			boardNclass_seq.add(bc_seq);
		}
		
		return boardNclass_seq ;
	}
	
	
public List<String> boardNclass_seq(List<ReportDTO> reportList){
		
		List<String> boardNclass_seq = new ArrayList<String>();
		
		for(ReportDTO rdto : reportList) {
			String bc_seq = null;
			if(rdto.getParent_seq().startsWith("cr")) {
				bc_seq = rdao.classSeqByReviewSeq(rdto.getParent_seq());
			}else if(rdto.getParent_seq().startsWith("r")) {
				bc_seq = rdao.boardSeqByReplySeq(rdto.getParent_seq());
			}else {
				bc_seq = "non";
			}
			boardNclass_seq.add(bc_seq);
		}
		
		return boardNclass_seq ;
	}
	
	//조건에 따른 블랙리스트 인원 뽑기
	public int totalBlackListCount(Map<String,Object> param) {
		return rdao.totalBlackListCount(param);
	}
	
	//조건에 맞는 블랙리스트 멤버 정보 추출
	public List<Map<String,String>> selectBlackListByPage(Map<String,Object> param,int start, int end){
		
		List<Map<String,String>> blackLists = rdao.selectBlackListByPage(param,start,end);
		
		for(Map<String,String> blackList:blackLists) {
			if(blackList.get("REPORT_COUNT")==null) {
				blackList.put("REPORT_COUNT", "0");
			}
			if(blackList.get("TYPE").equals("A")) {
				blackList.put("TYPE", "관리자");
			}else if(blackList.get("TYPE").equals("B")) {
				blackList.put("TYPE", "블랙리스트");
			}else {
				blackList.put("TYPE", "일반회원");
			}
		}
		
		return blackLists;
	}
	
	
	//블랙리스트 해제
	public void cancelBlackList(String[] barr) {
		rdao.cancelBlackList(barr);
	}
	
	//블랙리스트 등록
	public void regBlackList(String[] barr) {
		rdao.regBlackList(barr);
	}
	
	//이메일로 블랙리스트 회원 정보 불러오기
	public Map<String,String> memberInfoByEmail(String email) {
		
		Map<String,String> blackMember = rdao.memberInfoByEmail(email); 
		
		if(blackMember.get("REJECT")==null) {
			blackMember.put("REJECT", "0");
		}
		
		if(blackMember.get("REPORT")==null) {
			blackMember.put("REPORT", "0");
		}
		
		if(blackMember.get("TYPE").equals("M")) {
			blackMember.put("TYPE", "일반회원");
		}else if(blackMember.get("TYPE").equals("A")) {
			blackMember.put("TYPE", "관리자");
		}else {
			blackMember.put("TYPE", "블랙리스트");
		}
		
		
		return blackMember;
	}
	
	//해당 멤버의 각 카테고리 별 신고 수 뽑기
	public Map<String,String> reportCountByCategoty(String email) {
		Map<String,String> countByCategory = new HashMap<>(); //카테고리별 신고수 담을 Map
		List<Map<String,String>> list =  rdao.reportCountByCategoty(email);
		countByCategory.put("board", "0");
		countByCategory.put("reply", "0");
		countByCategory.put("review", "0");

			for(Map<String,String> map : list) {
				if(map.containsKey("LOCATION")) {
					System.out.println(map.get("LOCATION"));
					if(map.get("LOCATION").equals("댓글")) {
						countByCategory.put("reply", String.valueOf(map.get("COUNT")));
					}else if(map.get("LOCATION").equals("리뷰")) {
						countByCategory.put("review", String.valueOf(map.get("COUNT")));
					}else if(map.get("LOCATION").equals("게시글")) {
						countByCategory.put("board", String.valueOf(map.get("COUNT")));
					}
				}
			}
		return countByCategory; 				
	}
	
	//회원이 작성한 댓글 
	public List<Map<String,String>> ReplyByEmail(String email,int start,int end){
	
		return adao.ReplyByEmail(email,start,end);
	}
	//회원이 작성한 댓글 수
	public int countReplyByEmail(String email) {
		return adao.countReplyByEmail(email);
	}
	
	//해당 멤버의 신고 리스트 뽑기
	public List<ReportDTO> reportByEmail(String email,int start,int end){
			
		return rdao.reportByEmail(email,start,end);
	}
	
	public List<String> locationOfReport(List<ReportDTO> rList){
		//parent_seq에 따른 글 위치 표기
	
		List<String> locations = new ArrayList<String>();
		for(ReportDTO rdto : rList ) {
			String location = null;
			if(rdto.getParent_seq().startsWith("c")) {
				if(rdto.getParent_seq().startsWith("cr")) {
					location = "재능마켓/리뷰";
				}else {
					location = "재능마켓/게시글";
				}
			}else if(rdto.getParent_seq().startsWith("r")) {
				location = "커뮤니티/댓글";
			}else {
				location = "커뮤니티/게시글";
			}
			locations.add(location);
		}
		return locations;
	}
	
	//이메일로 신고 삭제 처리
	public void deleteAllReportByEmail(String email) {
		rdao.deleteAllReportByEmail(email);
	}
	
	//신고 선택 삭제 기능
//	public List<Timestamp> buyDayByEmailAndSeq(List<ClassDTO> BuyClassList){
//		for(ClassDTO cdto : BuyClassList) {
//			adao.buyDayByEmailAndSeq(cdto.getClass_seq(),cdto.)
//		}
//	}

	//

}
