package DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ReplyDTO;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class CommunityDAO {
	
	// @Autowired
	private SqlSession mybatis;

	//  CommunityDAO
	//게시글 정보 삽입(생성)
	public String insert(CommunityDTO dto) {		
		mybatis.insert("Community.insert",dto);
		return dto.getBoard_seq();
	}

	//해당 페이지의 게시글 가져오기
	public List<CommunityDTO> selectByPage(int start, int end, String category, String searchContent, String isHash) {
		Map<String, String> map = new HashMap<>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("category", category);
		map.put("searchContent", searchContent);
		map.put("isHash", isHash);

		return mybatis.selectList("Community.selectByPage",map);
	}
	
	//게시글 별 totalPage 가져오기
	public int totalPage(String category, String searchContent, String isHash) {
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("searchContent", searchContent);
		map.put("isHash", isHash);
		return mybatis.selectOne("Community.totalPage",map);
	}
	

	//게시글 정보 가져오기 by seq
	public CommunityDTO selectBySeq(String seq) {
		return mybatis.selectOne("Community.selectBySeq",seq);
	}
	
	
	//게시글 조회 수 up
	public void viewCountUp(String seq) {
		mybatis.update("Community.viewCountUp" , seq);
	}
	
	//게시글 더미 데이터 만들기
	public void dumy(){

		for(int i=0; i<144; i++) {
			mybatis.insert("Community.dumy",i);
		}

	}
	
	// MypageDAO
	// 내가 작성한 커뮤니티 글 보기
	public List<CommunityDTO> viewPost(String email) {
		return mybatis.selectList("Community.viewPost", email);
	}
	
	// 내가 댓글을 작성한 게시글 보기
	public List<CommunityDTO> replyPost(String email) {

		List<ReplyDTO> list = mybatis.selectList("Reply.viewReply", email);
		List<CommunityDTO> list1 = new ArrayList<>();

		for (ReplyDTO dto : list) {
			list1.addAll(mybatis.selectList("Community.replyPost", dto.getParent_seq()));
		}
		return list1;
	}
	
	
}
