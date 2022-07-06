package kh.spring.Controller;

import javax.servlet.http.HttpServletRequest;
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
@RequestMapping("/login/")
public class LoginController {
	
	@Autowired
	private LoginService loginService; 
	
	@Autowired
	private SignupService signupService;
	
	@Autowired
	private HttpSession session;
	
	
	// 로그인 계정 정보 확인
	@ResponseBody
	@RequestMapping("accountCheck")
	public boolean accountCheck(String email, String pw) {
		
		if (loginService.accountCheck(email, pw)) {
			
			System.out.println("계정 있음");
			
			return true;
			
		} else {
			
			System.out.println("계정 없음");
			
			return false;
		}
		
	}
	
	// PW찾기 계정 정보 확인 및 메일 전송
	@ResponseBody
	@RequestMapping("sendCode")
	public boolean sendCode(String name, String email) throws Exception{
		
		if(loginService.accountCheckBeforeSendCode(name, email)) {
			
			signupService.sendCode(email);
			System.out.println("전송 완료");
			
			return true;
			
		} else {
			
			return false;
		}
	}
	
	// 메일 인증번호 확인
	@ResponseBody
	@RequestMapping("mailAuth")
	public boolean mailAuth(String code, String email) throws Exception{
		
		if(loginService.mailAuth(code, email)) {
			
			System.out.println("인증 완료");
			
			return true;
			
		} else {
			
			return false;
		}
	}
	
	
	
	// 일반 로그인 처리
	@RequestMapping("login")
	public String login(String email, String pw) {
		
		// 로그인 세션
		MemberDTO dto = loginService.getMemberDTO(email, pw);
		
		session.setAttribute("loginID", dto.getEmail());
		session.setAttribute("MemberDTO", dto);
		
		System.out.println(dto.getEmail());
		System.out.println(dto.getPhone());
		System.out.println(session.getAttribute("loginID"));
		
		return "redirect:/";
		
	}
	
	// 로그아웃 처리
	@RequestMapping("logout")
	public String logout() {
		
		System.out.println(session.getAttribute("loginID"));
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// Email 찾기
	@ResponseBody
	@RequestMapping("findEmail")
	public String findEmail(String name, String phone) {
		
		String result = loginService.findEmail(name, phone);
		
		if(result.equals("null")){
			return "none";
		} else {
			return result;
		}
		
	}
	
	// PW 재설
	@ResponseBody
	@RequestMapping("resetPw")
	public String resetPw(String email, String pw) {
		
		int result = loginService.resetPw(email, pw);
		
		System.out.println(result);
		
		return result+"";
		
	}
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();

		return "error";
	}
	

}
