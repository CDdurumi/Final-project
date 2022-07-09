package DAO;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class MailauthLogDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	// 인증 로그 입력
	public int insertLog(String email, int code) {
		
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("code", code+"");
		
		return mybatis.insert("MA.insertLog", map);
		
	}
	
	// 이메일 인증
	public boolean mailAuth(String code, String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("code", code);
		
		return mybatis.selectOne("MA.mailAuth", map);
	}

}
