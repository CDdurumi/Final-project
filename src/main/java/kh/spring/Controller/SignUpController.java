package kh.spring.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.DTO.MemberDTO;
import kh.spring.Service.SignupService;

@Controller
@RequestMapping("/signup/")
public class SignUpController {
	
	@Autowired
	private SignupService signupService; 
	
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
		
		// 삭제 예정
		System.out.println(dto.getName());
		System.out.println(dto.getNickname());
		System.out.println(dto.getEmail());
		System.out.println(dto.getPassword());
		System.out.println(dto.getPhone());
		
		signupService.insertMember(dto);
		
		// 로그인 처리 예정
		
		return "redirect:/";
		
	}
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();

		return "error";
	}

}
