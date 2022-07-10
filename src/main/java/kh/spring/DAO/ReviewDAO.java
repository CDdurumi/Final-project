package kh.spring.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ReviewDTO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession mybatis;
	
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
	
	
	
	// 리뷰 좋아요 - 좋아요 테이블
	public int like(Map<String,String> map) throws Exception{
		return mybatis.insert("Review.like",map);
	}
	
	// 리뷰 좋아요 취소 - 좋아요 테이블
	public int likeCancel(Map<String,String> map) throws Exception{
		return mybatis.delete("Review.likeCancel",map);
	}

}
