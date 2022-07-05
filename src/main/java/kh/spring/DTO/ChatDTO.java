package kh.spring.DTO;

public class ChatDTO {
	public ChatDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatDTO(String room_code, String message) {
		this.room_code = room_code;
		this.message = message;
	}
	private String room_code;
	private String message;
	public String getRoom_code() {
		return room_code;
	}
	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
