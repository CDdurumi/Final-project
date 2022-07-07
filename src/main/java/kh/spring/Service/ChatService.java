package kh.spring.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.DAO.ChatDAO;
import kh.spring.DTO.ChatDTO;


@Service
public class ChatService {
	
	@Autowired
	private ChatDAO cdao;
	
	public void insert(ChatDTO cdto) {
		
		cdao.insert(cdto);
	}

	
	public List<ChatDTO> selectList(ChatDTO cdto) {
		return cdao.selectList(cdto);		
	}


	public List<ChatDTO> selectChatRoom(ChatDTO dto) {
		
		return cdao.selectChatRoom(dto);
	}


	public int search(String room, String invite_nickname, String my_nickname) {
		
		return cdao.insertSearch(room,invite_nickname,my_nickname);
		
	}
}
