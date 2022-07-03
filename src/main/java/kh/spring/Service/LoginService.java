package kh.spring.Service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kh.spring.DAO.LoginDAO;
import kh.spring.DTO.MemberDTO;
import utils.EncryptUtils;

@Service
public class LoginService {
	
	@Autowired
	LoginDAO lDAO;
	
	// 계정 정보 확인 서비스
	public boolean accountCheck(String email, String pw) {
		
		String encryptPw = EncryptUtils.SHA256(pw);
		
		return lDAO.accountCheck(email, encryptPw);
		
	}
	
	
	

	
}
