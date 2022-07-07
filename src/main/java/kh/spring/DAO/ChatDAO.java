package kh.spring.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ChatDTO;


@Repository
public class ChatDAO {
	@Autowired
	private SqlSession mybatis;
	
	public int insert(ChatDTO dto) {		
		
		return mybatis.insert("Chat.insert",dto);
	}
	
	public List<ChatDTO> selectList(ChatDTO dto) {
		return mybatis.selectList("Chat.selectRoom", dto.getRoom());
	}
	
	public List<ChatDTO> selectChatRoom(ChatDTO dto) {
		return mybatis.selectList("Chat.selectChatRoom", dto.getNickname());
	}

	
}
