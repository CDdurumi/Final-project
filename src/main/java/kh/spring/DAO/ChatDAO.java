package kh.spring.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int insertSearch(String room, String invite_nickname, String my_nickname) {
		Map<String, String> map = new HashMap<>();
		map.put("room", room);
		map.put("nickname", invite_nickname);		
		Map<String, String> map2 = new HashMap<>();
		map2.put("room", room);
		map2.put("nickname", my_nickname);
		mybatis.insert("insertSearch",map2);
		return mybatis.insert("insertSearch",map);
	}

	
}
