package kh.spring.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Pagination;
import kh.spring.DTO.RegStdsDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	//1. 관리자 페이지 메인
	
	// 조건에 맞는 회원 수(페이징)
	public int selectMemberCount(String targetType, String target) {
		Map<String,String> cond=new HashMap<>();
		cond.put("targetType", targetType);
		cond.put("target", target);
		return mybatis.selectOne("Admin.selectMemberCount",cond);
	}
	
	// 회원정보
	public List<MemberDTO> selectMemberByPage(Pagination page,String targetType,String target){
		Map<String,Object> cond = new HashMap<>();
		int start = page.getStart();
		int end = page.getEnd();
		cond.put("start", start);
		cond.put("end", end);
		cond.put("targetType", targetType);
		cond.put("target", target);
		
		return mybatis.selectList("Admin.selectMemberByPage",cond);
	}
	// 신고 수 뽑기 
	public int countReportById(String id) {
		return mybatis.selectOne("Admin.countReportById",id);
	}
	// 개설한 강의 수 뽑기
	public int CountOpenClassById(String id) {
		return mybatis.selectOne("Admin.CountOpenClassById",id);
	}
	
	public void adminMemberUpdate(String modiType,String modiContents,String email) {
		
		Map<String,String> cond = new HashMap<>();
		cond.put("modiType", modiType);
		cond.put("modiContents", modiContents);
		cond.put("email", email);
		mybatis.update("Admin.memberUpdate",cond);
	}
	
	public List<RegStdsDTO>  buyClassByEmail(String email,int start,int end) {
		Map<String,Object> cond = new HashMap<String,Object>();
		cond.put("email", email);
		cond.put("start", start);
		cond.put("end", end);
		return mybatis.selectList("Class.buyClassByEmail", cond);
	}
	
	public String buydayBySeq(String class_seq,String email){
		Map<String,String> cond = new HashMap<>();
		cond.put("class_seq", class_seq);
		cond.put("email", email);
		return mybatis.selectOne("Class.buydayBySeq",cond);
	}
	
//	public ClassDTO classListBySeq(String class_seq){
//		return mybatis.selectOne("Class.classListBySeq",class_seq);
//	}
	
	public int buyCountByEmail(String email) {
		return mybatis.selectOne("Class.buyCountByEmail",email);
	}
	
	public List<Map<String,Object>> buyClassListByPage(String email,int start,int end){
		Map<String,Object> cond = new HashMap<>();
		cond.put("email", email);
		cond.put("start", start);
		cond.put("end", end);
		cond.get("start");
		System.out.println("dao s : "+start );
		return mybatis.selectList("Class.buyClassListByPage",cond);
		
	}
	
	public String selectNicknameByEmail(String email) {
		return mybatis.selectOne("Admin.selectNicknameByEmail",email);
	}
	
	public MemberDTO selectMemberByEmail(String email) {
		return mybatis.selectOne("Admin.selectMemberByEmail",email);
	}
	
	//클래스 DAO로 옯기기
	
	//좋아요한 클래스 전체 수
	public int goodClassCount(String email) {
		return mybatis.selectOne("Admin.goodClassCount",email);
	}
	
	//좋아요한 클래스 리스트
	public List<Map<String,Object>> selectGoodClass(String email, int start, int end){
		Map<String,Object> cond = new HashMap<>();
		cond.put("email", email);
		cond.put("start", start);
		cond.put("end", end);
		return mybatis.selectList("Class.goodByPage",cond);
	}
	
	//오픈한 클래스 전체 수
	public int openClassCount(String email) {
		return mybatis.selectOne("Admin.openClassCount", email); 
	}
	
	//오픈한 클래스
	public List<Map<String,Object>> openCListByPage(String email,int start,int end){
		Map<String,Object> cond = new HashMap<>();
		cond.put("email", email);
		cond.put("start", start);
		cond.put("end", end);
		
		return mybatis.selectList("Admin.openCListByPage",cond);
	}	
	
	//멤버 클래스 디테일(ClassDTO,수강인원, 리뷰수, 평균 리뷰)
	public Map<String,Object> classDetail(String class_seq){
		return mybatis.selectOne("Admin.classDetail",class_seq);
	}
	

	//수강생 목록
	public List<Map<String,Object>> classStd(String class_seq){
		return mybatis.selectList("Admin.regBySeq",class_seq);
	}
	//리뷰 목록
	public List<Map<String,Object>> classReview(String class_seq){
		return mybatis.selectList("Admin.reviewBySeq",class_seq);
	}
	
	//구매 클래스 정보
	public Map<String,Object> classInfoByEmailNSeq(String regstds_seq){
		Map<String,Object> cond = new HashMap<>();
		cond.put("regstds_seq", regstds_seq);
		
		return mybatis.selectOne("Admin.classInfoByEmailNSeq",regstds_seq);
			
	}
	
	//해당 회원이 작성한 리뷰 전체 수
	public int reviewCountByEmail(String email) {
		return mybatis.selectOne("Admin.reviewCountByEmail",email);
	}
	
	//해당회원이 작성한 리뷰 리스트
	public List<Map<String,Object>> reviewListByPage(String email,int start,int end){
		Map<String,Object> cond = new HashMap<>();
		cond.put("email", email);
		cond.put("start", start);
		cond.put("end", end);
	
		
		return mybatis.selectList("Admin.reviewListByPage",cond);
	}

//커뮤니티 DAO에 옮길 거 

//해당 회원이 작성한 게시글 전체 수
public int boardCountByEmail(String email) {
	return mybatis.selectOne("Admin.boardCount",email);
}

//해당 회원이 작성한 게시글 리스트
public List<Map<String, String>> boardListByEmail(String email,int start, int end){
	Map<String,Object> cond = new HashMap<>();
	cond.put("email", email);
	cond.put("start", start);
	cond.put("end", end);
		
	
	return mybatis.selectList("Admin.boardByEmail",cond);
}

public String selectWrite_date(String board_seq) {
	return mybatis.selectOne("Admin.selectWrite_date", board_seq);
}

//게시글 메인이미지
public List<String> selectComuMainImgBySeq(List<Map<String,String>> boardList){
	List<String> mainImgList = new ArrayList<String>();
	
	for(Map<String,String> map:boardList) {
		ImgDTO img= mybatis.selectOne("Img.selectCoProfileByPar",map.get("BOARD_SEQ"));
		if(img==null) {
			mainImgList.add("0");
		}else {
			mainImgList.add(img.getSys_name());
		}
		
		
	}
	
	return mainImgList;
}

//회원이 작성한 수
public List<Map<String,String>> ReplyByEmail(String email,int start,int end){
	Map<String,Object> cond = new HashMap<>();
	cond.put("email", email);
	cond.put("start", start);
	cond.put("end", end);
	return mybatis.selectList("Admin.ReplyByEmail",cond);
}
//회원이 작성한 댓글 갯수
public int countReplyByEmail(String email) {
	return mybatis.selectOne("Admin.countReplyByEmail", email);
}
}