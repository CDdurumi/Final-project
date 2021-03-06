package kh.spring.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.DAO.ChatDAO;
import kh.spring.DTO.ChatDTO;
import kh.spring.DTO.ChatRoomDTO;
import kh.spring.DTO.MemberDTO;


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


	public List<ChatRoomDTO> selectChatRoom(ChatRoomDTO dto) {
		
		return cdao.selectChatRoom(dto);
	}


	public int search(String invite_nickname, String my_nickname) {
		
		return cdao.insertSearch(invite_nickname,my_nickname);
		
	}


	public int update_readok(ChatDTO dto) {
		
		return cdao.update_readok(dto);
		
	}


	public int pnav_readok(String nickname) {
		
		return cdao.pnav_readok(nickname);
	}


	public List<MemberDTO> autosearch(String nickname,String mynickname) {
		// TODO Auto-generated method stub
		return cdao.autosearch(nickname,mynickname);
	}


	public int delete_chat(int room) {
		
		return cdao.delete_chat(room);
		
	}


	public int chatToAdmin(String nickname) {
		
		return cdao.chatToAdmin(nickname);
	}


	


	
}
