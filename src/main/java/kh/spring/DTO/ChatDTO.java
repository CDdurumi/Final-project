package kh.spring.DTO;

public class ChatDTO {
	public ChatDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatDTO(String room, String message) {
		this.room = room;
		this.message = message;
	}
	private String room;
	private String message;
	
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
	
}
