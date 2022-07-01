package kh.spring.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	

}
