package kh.spring.DAO;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.MemberDTO;
import utils.EncryptUtils;

@Repository
public class LoginDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	//계정 확인 작업
	public boolean accountCheck(String email, String pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("email", email);
		map.put("pw", pw);
		
		return mybatis.selectOne("Login.pwCheck", map);
		
	}
	
	// 인증번호 전 계정 유무 확인
	public boolean accountCheckBeforeSendCode(String name, String email) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("name", name);
		map.put("email", email);
		
		return mybatis.selectOne("Login.accountCheckBeforeSendCode", map);
		
	}
	
	
	public MemberDTO getMemberDTO(String email, String pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("email", email);
		map.put("pw", pw);
		
		return mybatis.selectOne("Login.getMemberDTO", map);
	}

	
	// Email 찾기 관련 method
	// 1) 계정 유무
	public boolean isExistEmail(String name, String phone) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("name", name);
		map.put("phone", phone);
		
		return mybatis.selectOne("Login.isExistEmail", map);
		
	}
	
	// 2) 계정 정보
	public String getEmail(String name, String phone) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("name", name);
		map.put("phone", phone);
		
		MemberDTO dto = mybatis.selectOne("Login.getEmail", map);
		
		return dto.getEmail();
	}
	
	// 비밀번호 재설정
	public int resetPw(String email, String pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("email", email);
		map.put("pw", pw);
		
		return mybatis.update("Login.resetPw", map);
	}
	
	// 카카오 SNS 로그인 이메일 존재 ( 이메일, 로그인 타입 )
	public boolean snsEmailCheck(String email, String type) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("type", type);
		
		return mybatis.selectOne("Login.snsEmailCheck", map);
	}
	
	// 카카오 계정 정보 출력
	public MemberDTO getMemberDTO(String email) {
		
		return mybatis.selectOne("Login.getMemberDTObySNS", email);
	}
}
