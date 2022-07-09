package kh.spring.DTO;

public class ChatRoomDTO {
	
	/**
	 * 
	 */
	public ChatRoomDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param room
	 * @param nickname
	 * @param message
	 * @param write_date
	 */
	public ChatRoomDTO(int room, String nickname, String message, String write_date) {
		super();
		this.room = room;
		this.nickname = nickname;
		this.message = message;
		this.write_date = write_date;
	}
	private int room;
	private String nickname;
	private String message;	
	private String write_date;
	
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
}
