package kh.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.DTO.MemberDTO;
import kh.spring.Service.LoginService;

public class LoginValidator implements HandlerInterceptor{
	
	
	@Autowired
	private HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 
			throws Exception {
		
		String loginId =  (String)session.getAttribute("loginID");
		
		if(loginId != null) {
			
			System.out.println("로그인 세션이 존재합니다.");
			
			return true;
			
		} else {
			System.out.println("로그인 세션이 없습니다.");
		}
		
		System.out.println(loginId);
		
		response.sendRedirect("/");
		return false; 
		
	}
	
}
