package kh.spring.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ChatDTO;
import kh.spring.DTO.ChatRoomDTO;
import kh.spring.DTO.MemberDTO;



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
	
	public List<ChatRoomDTO> selectChatRoom(ChatRoomDTO dto) {
		return mybatis.selectList("Chat.selectChatRoom", dto.getNickname());
	}

	public int insertSearch(String invite_nickname, String my_nickname) {
		
		
		Map<String, String> map = new HashMap<>();
		map.put("invite_nickname", invite_nickname);
		map.put("my_nickname", my_nickname);
			
		
		
		return mybatis.insert("Chat.insertSearch",map);
	}

	public int update_readok(ChatDTO dto) {
				
		return mybatis.update("Chat.update_readok",dto);
	}

	public int pnav_readok(String nickname) {
		
		return mybatis.selectOne("Chat.pnav_readok",nickname);
	}

	public List<MemberDTO> autosearch(String nickname,String mynickname) {
		

		Map<String, String> map = new HashMap<>();
		map.put("nickname", nickname);
		map.put("mynickname", mynickname);
		
		return mybatis.selectList("Chat.autosearch",map);
	}

	
}
