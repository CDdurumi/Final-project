package kh.spring.DAO;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.MemberDTO;

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
	
	
}
