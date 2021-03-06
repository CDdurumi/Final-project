package DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.DTO.ChatDTO;
import kh.spring.DTO.ChatRoomDTO;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class ChatDAO {

	// @Autowired
	private SqlSession mybatis;
	
	public int insert(ChatDTO dto) {		
		
		return mybatis.insert("Chat.insert",dto);
	}
	
	public List<ChatDTO> selectList(ChatDTO dto) {
		return mybatis.selectList("Chat.selectRoom", dto.getRoom());
	}
	
	public List<ChatRoomDTO> selectChatRoom(ChatRoomDTO dto) {
		return mybatis.selectList("Chat.selectChatRoom", dto.getNickname());
	}

	public int insertSearch(String invite_nickname, String my_nickname) {
		
		
		Map<String, String> map = new HashMap<>();
		map.put("invite_nickname", invite_nickname);
		map.put("my_nickname", my_nickname);
			
		
		
		return mybatis.insert("Chat.insertSearch",map);
	}

	
}
