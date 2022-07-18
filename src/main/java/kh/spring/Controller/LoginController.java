package kh.spring.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		
		// 톰캣 재시작 시, 세션에 객체를 저장하면 유지가 원래 잘 안됨. 그래서 바꿔줌...
		session.setAttribute("name", dto.getName());
		session.setAttribute("email", dto.getEmail());
		session.setAttribute("nickname", dto.getNickname());
		session.setAttribute("phone", dto.getPhone());
		session.setAttribute("profile_img", dto.getProfile_img());
		session.setAttribute("join_date", dto.getJoin_date());
		session.setAttribute("type", dto.getType());
		session.setAttribute("login_type", dto.getLogin_type());
		
		// 로그인 기록
		loginService.loginHistory(dto.getEmail());

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
	

	//////// KAKAO Login ////////
	// 카카오 계정 로그인 
	@ResponseBody
	@RequestMapping("kakaoLogin")
	public boolean kakaoLogin(String email) {
		
		String type = "kakao";
		
		if(loginService.snsAccountCheck(email, type)) {
			
			session.setAttribute("loginID", email);
			
			MemberDTO dto = loginService.getMemberDTO(email);
			
			session.setAttribute("name", dto.getName());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("nickname", dto.getNickname());
			session.setAttribute("phone", dto.getPhone());
			session.setAttribute("profile_img", dto.getProfile_img());
			session.setAttribute("join_date", dto.getJoin_date());
			session.setAttribute("type", dto.getType());
			session.setAttribute("login_type", dto.getLogin_type());
			
			loginService.loginHistory(dto.getEmail());
			
			return true;
		} else {
			
			return false;
		}
	}
	
	// 카카오 계정 정보 입력 ( 첫 로그인 시 )
	@RequestMapping("insertData")
	public String insertData(MemberDTO dto) {
		
		MemberDTO loginDTO = loginService.insertData(dto);
		
		if(loginDTO != null) {
			
			session.setAttribute("loginID", loginDTO.getEmail());
			session.setAttribute("name", dto.getName());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("nickname", dto.getNickname());
			session.setAttribute("phone", dto.getPhone());
			session.setAttribute("profile_img", dto.getProfile_img());
			session.setAttribute("join_date", dto.getJoin_date());
			session.setAttribute("type", dto.getType());
			session.setAttribute("login_type", dto.getLogin_type());
			
			loginService.loginHistory(dto.getEmail());
			
		};
		
		return "redirect:/";
	}
	
	// 카카오 로그아웃
	// 카카오 세션 자체 삭제
	@ResponseBody
	@RequestMapping("kakaoLogout")
	public boolean kakaoLogout(String logout) {
		
		session.invalidate();
		
		return true;
	}
	
	//////// google Login ////////
	@ResponseBody
	@RequestMapping("googleLogin")
	public boolean googleLogin(String email) {
		
		String type = "google";
		
		if(loginService.snsAccountCheck(email, type)) {
			
			session.setAttribute("loginID", email);
			
			MemberDTO dto = loginService.getMemberDTO(email);
			
			session.setAttribute("name", dto.getName());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("nickname", dto.getNickname());
			session.setAttribute("phone", dto.getPhone());
			session.setAttribute("profile_img", dto.getProfile_img());
			session.setAttribute("join_date", dto.getJoin_date());
			session.setAttribute("type", dto.getType());
			session.setAttribute("login_type", dto.getLogin_type());

			loginService.loginHistory(dto.getEmail());
			
			return true;
			
		} else {

			return false;
		}
	}	
	
	@RequestMapping("insertDataForGoogle")
	public String insertDataForGoogle(MemberDTO dto) {
		
		MemberDTO loginDTO = loginService.insertDataForGoogle(dto);
		
		if(loginDTO != null) {
			
			session.setAttribute("loginID", loginDTO.getEmail());
			session.setAttribute("name", dto.getName());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("nickname", dto.getNickname());
			session.setAttribute("phone", dto.getPhone());
			session.setAttribute("profile_img", dto.getProfile_img());
			session.setAttribute("join_date", dto.getJoin_date());
			session.setAttribute("type", dto.getType());
			session.setAttribute("login_type", dto.getLogin_type());
			
			loginService.loginHistory(dto.getEmail());
			
		};
		
		return "redirect:/";
	}	
	
	@ResponseBody
	@RequestMapping("googleLogout")
	public boolean googleLogout(String logout) {
		
		session.invalidate();
		
		return true;
	}
	///////// Utill ////////////
	@ResponseBody
	@PostMapping("existSession")
	public boolean existSession() {
		
		String sessionId = (String)session.getAttribute("loginID");

		if(sessionId != null) {
			return true;
		} else {
			return false;
		}
	}
	
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();

		return "error";
	}
	

}
