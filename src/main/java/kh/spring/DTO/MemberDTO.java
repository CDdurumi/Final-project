package kh.spring.DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MemberDTO {
			private String name; 
			private String email;
			private String password; 
			private String nickname; 
			private String phone; 
			private String profile_img; // sys_name
			private Timestamp join_date; //
			private String type; // B:black, M:member, A:admin
			private String login_type; // N: 네이버, K: 카카오 D : 일반 - G : 구글은 사용 안함
			
			// 생성자
			public MemberDTO() {}

			public MemberDTO(String name, String email, String password, String nickname, String phone,
					String profile_img, Timestamp join_date, String type, String login_type) {
				super();
				this.name = name;
				this.email = email;
				this.password = password;
				this.nickname = nickname;
				this.phone = phone;
				this.profile_img = profile_img;
				this.join_date = join_date;
				this.type = type;
				this.login_type = login_type;
			}

			// Getter & Setter
			public String getName() {
				return name;
			}

			public void setName(String name) {
				this.name = name;
			}

			public String getEmail() {
				return email;
			}

			public void setEmail(String email) {
				this.email = email;
			}

			public String getPassword() {
				return password;
			}

			public void setPassword(String password) {
				this.password = password;
			}

			public String getNickname() {
				return nickname;
			}

			public void setNickname(String nickname) {
				this.nickname = nickname;
			}

			public String getPhone() {
				return phone;
			}

			public void setPhone(String phone) {
				this.phone = phone;
			}

			public String getProfile_img() {
				return profile_img;
			}

			public void setProfile_img(String profile_img) {
				this.profile_img = profile_img;
			}

			public Timestamp getJoin_date() {
				return join_date;
			}

			public void setJoin_date(Timestamp join_date) {
				this.join_date = join_date;
			}

			public String getType() {
				return type;
			}

			public void setType(String type) {
				this.type = type;
			}

			public String getLogin_type() {
				return login_type;
			}

			public void setLogin_type(String login_type) {
				this.login_type = login_type;
			}
			
			// 날짜 출력 형식
			public String getFormedDate() {
				SimpleDateFormat sdf = new SimpleDateFormat("yy.mm.dd");
				return sdf.format(this.join_date.getTime());
			}
			




}
