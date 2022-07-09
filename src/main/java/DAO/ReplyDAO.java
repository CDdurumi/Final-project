package DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ReplyDTO;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class ReplyDAO {
	
	// @Autowired
	private SqlSession mybatis;
	
	// MypageDAO
	// 내가 작성한 댓글 보기
	public List<ReplyDTO> viewReply(String email) {
		return mybatis.selectList("Reply.viewReply", email);
	}
	
	// 내가 작성한 커뮤니티 글의 댓글수 가져오기
	public List<Integer> getReplyCount(String email) {

		List<CommunityDTO> list = mybatis.selectList("Community.viewPost", email);
		List<Integer> list1 = new ArrayList<>();
		
		for (CommunityDTO dto : list) {
			list1.addAll(mybatis.selectList("Reply.getReplyCount", dto.getBoard_seq()));
		}
		return list1;
	}

}
