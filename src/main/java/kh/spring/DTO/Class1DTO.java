package kh.spring.DTO;

import java.sql.Timestamp;

public class Class1DTO {
	private String class_seq;
	private String category1;
	private String category2;
	private String title;
	private int price;
	private String zipcode;
	private String address1;
	private String address2;
	private Timestamp class_date;
	private String creater_id;
	private String creater_info;
	private Timestamp reg_date;
	private int like_count;
	private String state;
	
	public Class1DTO() {}
	
	public Class1DTO(String class_seq, String category1, String category2, String title, int price, String zipcode,
			String address1, String address2, Timestamp class_date, String creater_id, String creater_info,
			Timestamp reg_date, int like_count, String state) {
		super();
		this.class_seq = class_seq;
		this.category1 = category1;
		this.category2 = category2;
		this.title = title;
		this.price = price;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.class_date = class_date;
		this.creater_id = creater_id;
		this.creater_info = creater_info;
		this.reg_date = reg_date;
		this.like_count = like_count;
		this.state = state;
	}

	public String getClass_seq() {
		return class_seq;
	}

	public void setClass_seq(String class_seq) {
		this.class_seq = class_seq;
	}

	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public Timestamp getClass_date() {
		return class_date;
	}

	public void setClass_date(Timestamp class_date) {
		this.class_date = class_date;
	}

	public String getcreater_id() {
		return creater_id;
	}

	public void setcreater_id(String creater_id) {
		this.creater_id = creater_id;
	}

	public String getcreater_info() {
		return creater_info;
	}

	public void setcreater_info(String creater_info) {
		this.creater_info = creater_info;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
