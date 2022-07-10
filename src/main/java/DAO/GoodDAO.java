package DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class GoodDAO {
	
	// @Autowired
	private SqlSession mybatis;
	
	// 클래스 찜 관련
	public int likeOrNot(Map<String,String> map) {
		return mybatis.selectOne("Good.likeOrNot",map);
	}
	
	public int like(Map<String,String> map) {
		return mybatis.insert("Good.like",map);
	}
	
	public int likeCancel(Map<String,String> map) {
		return mybatis.delete("Good.likeCancel",map);
	}
	
	public int countLikes(String parent_seq) {
		return mybatis.selectOne("Good.countLikes",parent_seq);
	}
	
	public List<String> myLikeList(String email){
		return mybatis.selectList("Good.myLikeList",email);
	}
	
	
	// 클래스 리뷰 관련
	
	// 리뷰 좋아요 - 좋아요 테이블
	public int rLike(Map<String,String> map) throws Exception{
		return mybatis.insert("Good.rlike",map);
	}
	
	// 리뷰 좋아요 취소 - 좋아요 테이블
	public int rLikeCancel(Map<String,String> map) throws Exception{
		return mybatis.delete("Good.rlikeCancel",map);
	}

}
