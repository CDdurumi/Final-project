package kh.spring.Service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.DAO.LoginDAO;
import kh.spring.DAO.SignupDAO;
import kh.spring.DTO.MemberDTO;
import utils.EncryptUtils;

@Service
public class LoginService {
	
	@Autowired
	LoginDAO lDAO;
	
	@Autowired
	SignupDAO sDAO;
	
	// 계정 정보 확인 서비스
	public boolean accountCheck(String email, String pw) {
		
		String encryptPw = EncryptUtils.SHA256(pw);
		
		return lDAO.accountCheck(email, encryptPw);
		
	}
	
	// 계정 정보 확인 서비스
	public boolean accountCheckBeforeSendCode(String name, String email) {
		
		return lDAO.accountCheckBeforeSendCode(name, email);
		
	}
	
	// MemberDTO 세션에 담기
	public MemberDTO getMemberDTO(String email, String pw) {
	
		String encryptPw = EncryptUtils.SHA256(pw);
		
		return lDAO.getMemberDTO(email, encryptPw);
	}
	
	// Email 찾기 서비스 : Transaction 처리 필요
	public String findEmail(String name, String phone) {
		
		if(lDAO.isExistEmail(name, phone)) {

			return lDAO.getEmail(name, phone);
		
		} else {
			
			return "none";
		}
	}
	
	// 인증 번호 확인 서비스
	public boolean mailAuth(String code, String email) {
		
		if(sDAO.mailAuth(code, email)) {
			return true;
		} else {
			return false;
		}
		
	}
	
	// 비밀번호 재설정 서비스
	public int resetPw(String email, String pw) {
		
		String encryPw = utils.EncryptUtils.SHA256(pw);
		
		return lDAO.resetPw(email, encryPw);
		
	}
	
	// MemberDAO 이전 예정
	//////////////////// SNS 로그인 파트 //////////////////
	public boolean snsAccountCheck(String email, String type) {
		
		return lDAO.snsEmailCheck(email, type);
	}
	
	// MemberDTO 세션에 담기
	public MemberDTO getMemberDTO(String email) {
	
		return lDAO.getMemberDTO(email);
	}
	
	
	// 카카오 계정 정보 입력
	@Transactional
	public MemberDTO insertData(MemberDTO dto) {
		
		dto.setLogin_type("K");
		if(sDAO.insertData(dto)==1) {
			
			return getMemberDTO(dto.getEmail());
			
		}else{
			
			return 	null;
			
		}
		
	}
	
	// 구글 계정 정보 입력
	@Transactional
	public MemberDTO insertDataForGoogle(MemberDTO dto) {
		
		dto.setLogin_type("G");
		if(sDAO.insertData(dto)==1) {
			
			return getMemberDTO(dto.getEmail());
			
		}else{
			
			return 	null;
			
		}
		
	}
}
