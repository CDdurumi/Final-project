package kh.spring.DTO;

import java.sql.Timestamp;

public class ChatDTO {
	
	
	
	/**
	 * 
	 */
	public ChatDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param room
	 * @param message
	 * @param nickname
	 * @param write_date
	 * @param readok
	 * @param profile_img
	 */
	public ChatDTO(int room, String message, String nickname, String write_date, int readok, String profile_img) {
		super();
		this.room = room;
		this.message = message;
		this.nickname = nickname;
		this.write_date = write_date;
		this.readok = readok;
		this.profile_img = profile_img;
	}
	
	
	private int room;
	private String message;
	private String nickname;
	private String write_date;
	private int readok;
	private String profile_img;
	
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
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
	public int getReadok() {
		return readok;
	}
	public void setReadok(int readok) {
		this.readok = readok;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	
	
	
}
