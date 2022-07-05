package kh.spring.DTO;

public class ImgDTO {
	private String img_seq;
	private String ori_name;
	private String sys_name;
	private String img_desc;
	private String parent_seq;
	public ImgDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImgDTO(String img_seq, String ori_name, String sys_name, String img_desc, String parent_seq) {
		super();
		this.img_seq = img_seq;
		this.ori_name = ori_name;
		this.sys_name = sys_name;
		this.img_desc = img_desc;
		this.parent_seq = parent_seq;
	}
	public String getImg_seq() {
		return img_seq;
	}
	public void setImg_seq(String img_seq) {
		this.img_seq = img_seq;
	}
	public String getOri_name() {
		return ori_name;
	}
	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
	}
	public String getSys_name() {
		return sys_name;
	}
	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}
	public String getimg_desc() {
		return img_desc;
	}
	public void setimg_desc(String img_desc) {
		this.img_desc = img_desc;
	}
	public String getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(String parent_seq) {
		this.parent_seq = parent_seq;
	}
	
	
}
