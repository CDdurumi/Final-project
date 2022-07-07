package kh.spring.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Pagination;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	//1. 관리자 페이지 메인
	
	// 전체 회원 수(페이징)
	public int selectAllMemberCount() {
		return mybatis.selectOne("Admin.selectAllMemberCount");
	}
	
	// 회원정보
	public List<MemberDTO> selectMemberByPage(Pagination page){
		return mybatis.selectList("Admin.selectMemberByPage",page);
	}
	// 신고 수 뽑기 
	public int countReportById(String id) {
		return mybatis.selectOne("Admin.countReportById",id);
	}
	// 개설한 강의 수 뽑기
	public int CountOpenClassById(String id) {
		return mybatis.selectOne("Admin.CountOpenClassById",id);
	}
	

}
