package kh.spring.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import kh.spring.DAO.AdminDAO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Pagination;


@Service
public class AdminService {

	@Autowired
	AdminDAO adao;
	
	@Autowired
	Gson g;
	
	//1. 관리자 페이지 메인
	
	//회원리스트 뽑기
	public Map<String,String> memberListByPage(Pagination page){
		List<MemberDTO> mList = adao.selectMemberByPage(page);//회원정보
		List<Map<String,Object>> rNcCountList = new ArrayList<Map<String,Object>>();//신고수와 개설강의수 넣어줄 리스트
		for(MemberDTO dto:mList) {
			//신고 수 뽑기
			Map<String,Object> map = new HashMap<String,Object>();
			int reportCount = adao.countReportById(dto.getEmail());
			map.put("reportCount", reportCount);

			//개설 강의 수 뽑기
			int openClassCount = adao.CountOpenClassById(dto.getEmail());
			map.put("openClassCount", openClassCount);

			rNcCountList.add(map);	
		}
		
		//회원 리스트와 신고,강의 수 담을 map
		Map<String,String> map = new HashMap<>(); 
		map.put("mList", g.toJson(mList));
		map.put("rNcCountList", g.toJson(rNcCountList));
		
		return map;
	}
	
	//  전체 회원 수(페이징)
	public int selectAllMemberCount() {
		return adao.selectAllMemberCount();
	}
	
	//  회원정보
//	public List<MemberDTO> selectMemberByPage(Pagination page){
//		return adao.selectMemberByPage(page);
//	}
//	//  신고 수 뽑기 
//	public int countReportById(String id) {
//		return adao.countReportById(id);
//	}
//	
//	//  개설한 강의 수 뽑기
//	public int CountOpenClassById(String id) {
//		return adao.CountOpenClassById(id);
//	}
//	


//	public void dumDate() {
//		adao.dumData();
//	}
}
