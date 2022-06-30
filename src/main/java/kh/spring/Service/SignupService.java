package kh.spring.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.DAO.SignupDAO;

@Service
public class SignupService {
	
	@Autowired
	SignupDAO sDAO;
	
	// 닉네임 중복확인 서비스
	public boolean isNickname(String nickname) {
		
		return sDAO.isNickname(nickname);
		
	}
	
	// 이메일 중복확인 서비스
	public boolean isExistEmail(String email) {
		
		return sDAO.isExistEmail(email);
		
	}
	
}
