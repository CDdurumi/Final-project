package DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.RegStdsDTO;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class ClassRegstdsDAO {
	
	// @Autowired
	private SqlSession mybatis;
	
	// ClassDAO
	// 구매 관련
	public int regOrNot(Map<String,String> map) {
		return mybatis.selectOne("Regstds.regOrNot",map);
	}

	public int reg(Map<String,String> map) {
		return mybatis.insert("Regstds.reg",map);
	}
	
	public int countStds(String parent_seq) {
		return mybatis.selectOne("Regstds.countStds",parent_seq);
	}
	
	// MypageDAO
	// 클래스 등록현황
	public List<RegStdsDTO> getRegiDetail(String class_seq) {
		return mybatis.selectList("Regstds.getRegiDetail", class_seq);
	}
	
	// 클래스 구매일
	public List<String> buyClassDate(String email) {
		return mybatis.selectList("Regstds.buyClassDate", email);
	}
	
	// 내가 등록한 클래스의 수강 신청 인원 보기
	public List<Integer> myClassStds(String email) {
		
		List<ClassDTO> list = mybatis.selectList("Class.regClass", email);
		List<Integer> list1 = new ArrayList<>();
		
		for (ClassDTO dto : list) {
			list1.addAll(mybatis.selectList("Regstds.myClassStds", dto.getClass_seq()));
		}
		return list1;
	}
	
	
}
