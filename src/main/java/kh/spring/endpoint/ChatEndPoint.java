package kh.spring.endpoint;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.collect.EvictingQueue;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.spring.configurator.CTXprovider;
import kh.spring.configurator.WebSocketConfigurator;
import kh.spring.DTO.ChatDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.Service.ChatService;

@ServerEndpoint(value="/chat",configurator = WebSocketConfigurator.class)
public class ChatEndPoint {

	//private static EvictingQueue<ChatDTO> queue = EvictingQueue.create(20); 
	private static  Gson gson = new Gson();
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>()) ;
	@Autowired
	private HttpSession hSession;
	
	private ChatService cServ = CTXprovider.ctx.getBean(ChatService.class);
	
	
	
	@OnOpen
	   public void onConnect(Session session, EndpointConfig config) {
	      this.hSession = (HttpSession)config.getUserProperties().get("hSession");
	      clients.add(session);
	      
	      
	      
	      System.out.println(hSession.getAttribute("loginID")+ " 접속  접속인원 : " + clients.size());
	     try {
			JsonObject data = new JsonObject();
			//인원수체크
			data.addProperty("conp", clients.size());
			session.getBasicRemote().sendText(gson.toJson(data));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	      
	   }

	@OnMessage
	public void onMessage(String obj) {
		
		System.out.println(obj);
		Gson gson = new Gson();	    
	    ChatDTO Cdto = gson.fromJson(obj, ChatDTO.class);
	    //ChatDTO에 담긴 정보들 room , nickname , message , write_date (null),profile_img
	    
	    JsonObject data = new JsonObject();
	    
		SimpleDateFormat format = new SimpleDateFormat ( "MM월 dd일 HH:mm:ss");
	    Date time = new Date();
		String chatTime = format.format(time);
		
		Cdto.setWrite_date(chatTime);  //날짜 dto에 넣어주기 ChatDTO에 담긴 정보들 room , nickname , message , write_date 
		
		cServ.insert(Cdto); //받아온 obj 메세지 db에 저장
		
		data.addProperty("room", Cdto.getRoom());
		data.addProperty("nickname", Cdto.getNickname());
		data.addProperty("message", Cdto.getMessage());
		data.addProperty("write_date", chatTime);
		data.addProperty("profile_img", Cdto.getProfile_img());
		//queue.add(new ChatDTO(id,message,chatTime));
		
		JsonArray arr = new JsonArray();
		arr.add(data);
		
		synchronized(clients) {

			for(Session client : clients) {
				try {
					client.getBasicRemote().sendText(arr.toString());
					
					  //data.addProperty("conp", clients.size());
					  //client.getBasicRemote().sendText(gson.toJson(data));
					 
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	    System.out.println("접속 해제 : 접속자 수 : " +clients.size());
	}
	
	@OnError
	public void onError(Session session,Throwable t) {
		t.printStackTrace();
		clients.remove(session);
	}
}
