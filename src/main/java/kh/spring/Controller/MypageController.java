package kh.spring.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DAO.MypageDAO;
import kh.spring.DTO.MemberDTO;
import kh.spring.Service.MypageService;

@Controller
@RequestMapping("/myPage/")
public class MypageController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MypageService mpServ;
	
	@RequestMapping("main")
	public String main() throws Exception {
//		String email = (String)session.getAttribute("loginID");
		String email = ("abc123@naver.com");
		
		session.setAttribute("realPath", session.getServletContext().getRealPath("upload"));
		
		MemberDTO dto = mpServ.select(email);
		session.setAttribute("dto", dto);
		return "/member/myPage";
	}
	
	// 회원 탈퇴
	@RequestMapping("memberOut")
	public String memberOut() throws Exception {
//		String email = (String)session.getAttribute("loginID");
		String email = ("abc123@naver.com");
		mpServ.delete(email);
//		session.invalidate();
		return "redirect:/";
	}
	
	// 연락처, 닉네임만 수정
	@RequestMapping("updateInfo")
	public String updateInfo(MemberDTO dto) throws Exception {
		mpServ.updateInfo(dto);
//		session.setAttribute("loginUser", dto.getName());
		return "redirect:/myPage/main";
	}
	
	// 프로필 이미지 수정
	@RequestMapping("updateImage")
	public String updateImage(MultipartFile file) throws Exception {
		String realPath = session.getServletContext().getRealPath("upload");
		String email = ("abc123@naver.com");
		mpServ.updateImage(email, realPath, file);

		return "redirect:/myPage/main";
	}
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
