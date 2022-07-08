package kh.spring.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.DAO.AdminDAO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Pagination;


@Service
public class AdminService {

	@Autowired
	AdminDAO adao;
	
	//1. 관리자 페이지 메인
	
	//  전체 회원 수(페이징)
	public int selectAllMemberCount() {
		return adao.selectAllMemberCount();
	}
	
	//  회원정보
	public List<MemberDTO> selectMemberByPage(Pagination page){
		return adao.selectMemberByPage(page);
	}
	//  신고 수 뽑기 
	public int countReportById(String id) {
		return adao.countReportById(id);
	}
	
	//  개설한 강의 수 뽑기
	public int CountOpenClassById(String id) {
		return adao.CountOpenClassById(id);
	}
	
	//회원 검색
	public List<MemberDTO> searchMember(String targetType, String target){
		
		//
		
	}

//	public void dumDate() {
//		adao.dumData();
//	}
}
