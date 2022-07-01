package kh.spring.Service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kh.spring.DAO.SignupDAO;

@Service
public class SignupService {
	
	@Autowired
	SignupDAO sDAO;
	
	// 메일 API 구현체
	@Autowired
	private JavaMailSender mailSender;
	
	// 닉네임 중복확인 서비스
	public boolean isNickname(String nickname) {
		
		return sDAO.isNickname(nickname);
		
	}
	
	// 이메일 중복확인 서비스
	public boolean isExistEmail(String email) {
		
		return sDAO.isExistEmail(email);
		
	}
	
	// 이메일 전송 서비스
	public boolean sendCode(String email) throws Exception{
		
		String subject = "[DOWA 회원가입]이메일 인증코드입니다.";
		String content = "abcd1234";
		String from = "officialdowa02@gmail.com";
		String to = email;
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			// mail - 메일 객체, mailHelper - 셋팅된 메일 객체
			
			// 보낸이 - 받는이
			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			
			// 제목 - 내용
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
