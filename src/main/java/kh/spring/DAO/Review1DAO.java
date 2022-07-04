package kh.spring.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.Class1DTO;
import kh.spring.DTO.Review1DTO;

@Repository
public class Review1DAO {

	@Autowired
	private SqlSession mybatis;

	// 내가 작성한 리뷰
	public List<Review1DTO> classReview(String email) {
		return mybatis.selectList("Mypage.classReview", email);
	}
}
