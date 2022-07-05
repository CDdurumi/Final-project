package kh.spring.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.Class1DTO;

@Repository
public class Class1DAO {

	@Autowired
	private SqlSession mybatis;

	// 내가 등록한 클래스 정보
	public List<Class1DTO> regClass(String email) {
		return mybatis.selectList("Mypage.regClass", email);
	}

	// 내가 구매한 클래스 정보
	public List<Class1DTO> buyClass(String email) {

		List<Class1DTO> list = new ArrayList<>();

		for (int i = 0; i < mybatis.selectList("Mypage.buyClass", email).size(); i++) {
			String class_seq = (String) mybatis.selectList("Mypage.buyClass", email).get(i);
			list.addAll(mybatis.selectList("Mypage.buyClassList", class_seq));
		}
		return list;
	}

	// 클래스 구매일
	public List<String> buyClassDate(String email) {
		return mybatis.selectList("Mypage.buyClassDate", email);
	}
}
