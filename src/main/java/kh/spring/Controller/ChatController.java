package kh.spring.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.spring.DTO.ChatDTO;
import kh.spring.DTO.ChatRoomDTO;
import kh.spring.DTO.MemberDTO;
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
		
		
		
		
		List<ChatDTO> chatlist = cServ.selectList(dto);
		
		
		map.put("chatlist", chatlist);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("selectChatRoom")
	public String selectChatRoom(ChatRoomDTO dto) throws Exception{
		
		
					
		List<ChatRoomDTO> chatRoom = cServ.selectChatRoom(dto);
		
		
		return g.toJson(chatRoom);
	}
	
	@ResponseBody
	@RequestMapping("search")
	public String search(String invite_nickname,String my_nickname ) throws Exception{
		
		
		int room = cServ.search(invite_nickname,my_nickname);
		
		return g.toJson(room);
	}
	
	@ResponseBody
	@RequestMapping("autosearch")
	public String autosearch(String nickname,String mynickname) throws Exception{
		
		
		List<MemberDTO> mList  = cServ.autosearch(nickname,mynickname);
		
		return g.toJson(mList);
	}
	
	

	@ResponseBody
	@RequestMapping("update_readok")
	public void update_readok(ChatDTO dto) throws Exception{
		
		cServ.update_readok(dto);
	}
	
	@ResponseBody
	@RequestMapping("pnav_readok")
	public String pnav_readok(String nickname) throws Exception{
		
		
		
		int num = cServ.pnav_readok(nickname);
		
		return g.toJson(num);
	}
	
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
