package kh.spring.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.spring.DTO.ChatDTO;

import kh.spring.Service.ChatService;

@Controller
@RequestMapping("/chat/")
public class ChatController {
	@Autowired
	private ChatService cServ;
	
	@Autowired
	private Gson g;
	
	@ResponseBody
	@RequestMapping("selectList")
	public Map<String,Object> selectList(ChatDTO dto) throws Exception{
				
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(dto.getRoom());
		
		
		List<ChatDTO> chatlist = cServ.selectList(dto);
		
		
		map.put("chatlist", chatlist);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("selectChatRoom")
	public Map<String,Object> selectChatRoom(ChatDTO dto) throws Exception{
		
		System.out.println("selectChatRoom");
		System.out.println(dto.getNickname());
		
		Map<String, Object> map = new HashMap<String, Object>();				
		List<ChatDTO> chatRoom = cServ.selectChatRoom(dto);
		
		
		map.put("chatRoom", chatRoom);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("search")
	public String search(String room ,String invite_nickname,String my_nickname ) throws Exception{
		
		System.out.println("search");
		System.out.println(room +" : "+ invite_nickname +" : "+ my_nickname);
		cServ.search(room,invite_nickname,my_nickname);
		
		return g.toJson(room);
	}
}
