package DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ReviewDTO;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class ReviewDAO {
	
	// @Autowired
	private SqlSession mybatis;
	
	// MypageDAO
	// 내가 작성한 리뷰
	public List<ReviewDTO> classReview(String email) {
		return mybatis.selectList("ClassRv.classReview", email);
	}
	
	// 내가 등록한 클래스의 리뷰 모두 보기
	public List<ReviewDTO> allClassReview(String parent_seq) {
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
	
	// 클래스DAO
	
	// 작성한 리뷰 저장
	public int insert(ReviewDTO rdto) throws Exception{
		return mybatis.insert("Review.insert",rdto);
	}
	
	// 리뷰 작성 여부 확인
	public int writeOrNot(Map<String, String> param) throws Exception{
		return mybatis.selectOne("Review.writeOrNot",param);
	}
	
	// 클래스 리뷰 목록 (비회원)
	public List<Map<String,Object>> selectByPSeq(String parent_seq) throws Exception{
		return mybatis.selectList("Review.selectByPSeq",parent_seq);
	}
	
	// 클래스 리뷰 목록 (회원)
	public List<Map<String,Object>> selectByPSeqId(Map<String,String> param) throws Exception{
		return mybatis.selectList("Review.selectByPSeqId",param);
	}
	
	// 클래스 현재 별점 확인
	public Map<String,Object> checkStars(String parent_seq){
		return mybatis.selectOne("Review.checkStars",parent_seq);
	}
	
	// 수정한 리뷰 저장
	public int modify(ReviewDTO rdto) throws Exception{
		return mybatis.update("Review.modify",rdto);
	}
	
	// 리뷰 삭제
	public int delete(String review_seq) throws Exception{
		return mybatis.delete("Review.delete",review_seq);
	}
	
	// 좋아요 +1
	public int addLike(String review_seq) throws Exception{
		return mybatis.update("Review.addLike",review_seq);
	}
	
	// 좋아요 -1
	public int subLike(String review_seq) throws Exception{
		return mybatis.update("Review.subLike",review_seq);
	}
	
	// 총 좋아요 수
	public int getLikeCount(String review_seq) throws Exception{
		return mybatis.selectOne("Review.getLikeCount",review_seq);
	}

}
