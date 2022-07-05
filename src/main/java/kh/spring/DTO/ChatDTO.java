package kh.spring.DTO;

import java.sql.Timestamp;

public class ChatDTO {
	public ChatDTO(String room, String message, String nickname, String write_date) {
		this.room = room;
		this.message = message;
		this.nickname = nickname;
		this.write_date = write_date;
	}
	public ChatDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	private String room;
	private String message;
	private String nickname;
	private String write_date;
	
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	
	
}
