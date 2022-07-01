package kh.spring.DAO;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.MemberDTO;

@Repository
public class SignupDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	//닉네임 중복확인
	public boolean isNickname(String nickname) {
		
		String sql = "select count(*) from member where id=?";
		
		return mybatis.selectOne("Signup.isNickname", nickname);
		
	}
	
	// 이메일 중복확인
	public boolean isExistEmail(String email) {
		
		return mybatis.selectOne("Signup.isExistEmail",email);
		
	}
	
	// 인증 로그 입력
	public int insertLog(String email, int code) {
		
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("code", code+"");
		
		return mybatis.insert("Signup.insertLog", map);
		
	}
	
	// 이메일 인증
	public boolean mailAuth(String code, String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("code", code);
		
		return mybatis.selectOne("Signup.mailAuth", map);
	}
	
	// 회원가입
	public int insertMember(MemberDTO dto) {
		
		return mybatis.insert("Signup.insertMember", dto);
	}

}
