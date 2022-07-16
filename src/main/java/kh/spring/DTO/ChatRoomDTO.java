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
	 * @param roomname
	 * @param readok
	 * @param profile_img
	 */
	public ChatRoomDTO(int room, String nickname, String message, String write_date, String roomname, int readok,
			String profile_img) {
		super();
		this.room = room;
		this.nickname = nickname;
		this.message = message;
		this.write_date = write_date;
		this.roomname = roomname;
		this.readok = readok;
		this.profile_img = profile_img;
	}
	private int room;
	private String nickname;
	private String message;	
	private String write_date;
	private String roomname;
	private int readok;
	private String profile_img;
	
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
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
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
