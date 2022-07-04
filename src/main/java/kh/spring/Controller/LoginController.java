package kh.spring.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.Service.LoginService;
import kh.spring.Service.SignupService;

@Controller
@RequestMapping("/login/")
public class LoginController {
	
	@Autowired
	private LoginService loginService; 
	
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
	
	// 일반 로그인 처리
	@RequestMapping("login")
	public String login(String email, String pw) {
		
		session.setAttribute("loginID", email);
		
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

}
