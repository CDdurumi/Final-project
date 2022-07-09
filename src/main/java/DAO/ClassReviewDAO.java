package DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ClassReviewDTO;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class ClassReviewDAO {
	
	// @Autowired
	private SqlSession mybatis;
	
	// MypageDAO
	// 내가 작성한 리뷰
	public List<ClassReviewDTO> classReview(String email) {
		return mybatis.selectList("ClassRv.classReview", email);
	}
	
	// 내가 등록한 클래스의 리뷰 모두 보기
	public List<ClassReviewDTO> allClassReview(String parent_seq) {
		return mybatis.selectList("ClassRv.allClassReview", parent_seq);
	}
	
	// 내가 등록한 클래스의 리뷰수, 별점 평균 가져오기
	public List<Map<String, String>> reviewDetail(String email) {
	
		List<ClassDTO> list = mybatis.selectList("Class.regClass", email);
		List<Map<String,String>> result = new ArrayList<>();
		
		for(ClassDTO dto : list) {
			result.addAll(mybatis.selectList("ClassRv.reviewdetail", dto.getClass_seq()));
		}
		return result;
	}

}
