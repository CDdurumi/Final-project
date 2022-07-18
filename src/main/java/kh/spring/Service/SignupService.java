package kh.spring.Service;

import java.lang.System.Logger;
import java.util.Random;

import javax.crypto.EncryptedPrivateKeyInfo;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kh.spring.DAO.SignupDAO;
import kh.spring.DTO.MemberDTO;
import utils.EncryptUtils;
import utils.SendCode;

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
	public void sendCode(String email) throws Exception{
		
		String subject = "[DOWA 회원가입]이메일 인증번호입니다.";
		String content;
		String from = "DOWA <officialdowa02@gmail.com>";
		String to = email;
		
		int code = SendCode.getCode();
		
		System.out.println(code); // 삭제예정
		
		content = 
				"회원가입을 위한 인증번호를 보내드립니다." +
				"<br><br>" +
				"인증 번호는 [ " + code + " ] 입니다.<br>" +
				"해당 인증번호를 확인란에 기입하세요.";

		System.out.println(email); // 삭제예정
		
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
			
			// 전송
			mailSender.send(mail);
			
			// DB에 로그 입력
			sDAO.insertLog(email, code);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 이메일 인증 서비스
	public boolean mailAuth(String code, String email) {
		
		if(sDAO.mailAuth(code, email)) {
			return true;
		} else {
			return false;
		}
		
	}
	
	// 일반 회원가입
	public int insertMember(MemberDTO dto) {
		
		System.out.println("회원가입 서비스 실행");
		// 비밀번호 암호화
		String encryptPw = EncryptUtils.SHA256(dto.getPassword());
		dto.setPassword(encryptPw);
		
		int result = sDAO.insertMember(dto);
		
		System.out.println("회원가입 서비스 실행 완료");
		
		return result;
		
	}

	
}
