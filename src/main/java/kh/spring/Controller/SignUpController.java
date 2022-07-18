package kh.spring.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.DTO.MemberDTO;
import kh.spring.Service.LoginService;
import kh.spring.Service.SignupService;

@Controller
@RequestMapping("/signup/")
public class SignUpController {
	
	@Autowired
	private SignupService signupService; 
	
	@Autowired
	private LoginService loginService; 
	
	@Autowired
	private HttpSession session;
	
	@ResponseBody
	@RequestMapping("nickNameCheck")
	public boolean nickNameCheck(String nickname) throws Exception{
		// 닉네임 중복 확인 메서드
		signupService.isNickname(nickname);
		
		return signupService.isNickname(nickname);
	}
	
	@ResponseBody
	@RequestMapping("sendCode")
	public boolean checkMail(String email) throws Exception{
		
		// 삭제 예정
		System.out.println(email);

		// 메일 중복이 없을 때만 인증 코드 전송
		if(!signupService.isExistEmail(email)) {
			
			// 인증 코드 전송 모듈
			signupService.sendCode(email);
			System.out.println("전송완료");
			return true;
			
			
		} else {
			
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping("mailAuth")
	public boolean mailAuth(String code, String email) throws Exception{
		
		// 삭제 예정
		System.out.println(code);
		System.out.println(email);
		
		if(signupService.mailAuth(code, email)) {
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping("insertMember")
	public String insertMember(MemberDTO dto) throws Exception{
		
		signupService.insertMember(dto);
		
		// 로그인 처리
		session.setAttribute("loginID", dto.getEmail());
		
		MemberDTO loginDTO = loginService.getMemberDTO(dto.getEmail());
		
		session.setAttribute("name", loginDTO.getName());
		session.setAttribute("email", loginDTO.getEmail());
		session.setAttribute("nickname", loginDTO.getNickname());
		session.setAttribute("phone", loginDTO.getPhone());
		session.setAttribute("profile_img", loginDTO.getProfile_img());
		session.setAttribute("join_date", loginDTO.getJoin_date());
		session.setAttribute("type", loginDTO.getType());
		session.setAttribute("login_type", loginDTO.getLogin_type());		
		
		System.out.println("계정 타입 : " + (String)session.getAttribute("login_type"));
		
		loginService.loginHistory(dto.getEmail());
		
		return "redirect:/";
		
	}
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();

		return "error";
	}

}
