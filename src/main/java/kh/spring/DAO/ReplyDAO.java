package kh.spring.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ReplyDTO;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	//댓글·대댓글 상태 변경
	public void replyStateModi(String seq, String state) {
		Map<String, String> map = new HashMap<>();
		map.put("seq", seq);
		map.put("state", state);
		mybatis.update("Reply.replyStateModi", map);
	}
	
	
	//댓글 등록
	public String replyReg(ReplyDTO dto) {
		mybatis.insert("Reply.replyReg", dto);
		return dto.getReply_seq();
	}
	
	//댓글 정보 가져와기(멤버와 조인해서)
	public List<Map<String, Object>> getReply(String seq){
		return mybatis.selectList("Reply.getReply", seq);
	}
	
	//해당 게시글 댓글 리스트
	public List<Map<String, Object>> replyList(String board_seq) {
		return mybatis.selectList("Reply.replyList", board_seq);
	}
	
}
