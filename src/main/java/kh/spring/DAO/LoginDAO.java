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
	
	
}
