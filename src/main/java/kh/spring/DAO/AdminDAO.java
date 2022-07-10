package kh.spring.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Pagination;

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
	
	public List<String>  buyClassByEmail(String email) {
		return mybatis.selectList("Class.buyClassByEmail", email);
	}
	
	public ClassDTO classListBySeq(String class_seq){
		return mybatis.selectOne("Class.classListBySeq",class_seq);
	}

}
