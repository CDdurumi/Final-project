package kh.spring.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/")
	public String mypage() throws Exception {
		String id = (String)session.getAttribute("loginID");
//		MemberDTO dto = dao.select(id);
//		session.setAttribute("dto", dto);
		return "/member/myPage";
	}
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
