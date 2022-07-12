package kh.spring.DAO;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	//댓글·대댓글 상태 변경
	public void replyStateModi(String seq, String state) {
		Map<String, String> map = new HashMap<>();
		map.put("seq", seq);
		map.put("state", state);
		mybatis.selectOne("Reply.replyStateModi", map);
	}
	
}
