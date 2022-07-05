package kh.spring.Controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Review1DTO;
import kh.spring.Service.MypageService;

@Controller
@RequestMapping("/myPage/")
public class MypageController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MypageService mpServ;
	
	@RequestMapping("main")
	public String main(Model model) throws Exception {
		String email = (String)session.getAttribute("loginID");
		session.setAttribute("realPath", session.getServletContext().getRealPath("upload"));
		
		MemberDTO dto = mpServ.select(email); // 내 정보 보기
		List<ClassDTO> buyclist = mpServ.buyClass(email); // 내가 구매한 클래스 보기
		List<String> buydaylist = mpServ.buyClassDate(email); // 클래스 구매일
		List<ClassDTO> rgclist = mpServ.regClass(email); // 내가 등록한 클래스 보기
		List<Review1DTO> reviewlist = mpServ.classReview(email); // 내가 작성한 리뷰 보기
		List<ClassDTO> reviewclist = mpServ.reviewClass(email); // 내가 작성한 리뷰의 클래스 정보 보기
		
		session.setAttribute("dto", dto);
		model.addAttribute("buyclist",buyclist);
		model.addAttribute("buydaylist",buydaylist);
		model.addAttribute("rgclist",rgclist);
		model.addAttribute("reviewlist",reviewlist);
		model.addAttribute("reviewclist",reviewclist);
		
		return "/member/myPage";
	}
	
	// 회원 탈퇴
	@RequestMapping("memberOut")
	public String memberOut() throws Exception {
		String email = (String)session.getAttribute("loginID");
		mpServ.delete(email);
		session.invalidate();
		return "redirect:/";
	}
	
	// 연락처, 닉네임만 수정
	@RequestMapping("updateInfo")
	public String updateInfo(MemberDTO dto) throws Exception {
		mpServ.updateInfo(dto);
		return "redirect:/myPage/main";
	}
	
	// 프로필 이미지 수정, 삭제
	@RequestMapping("updateImage")
	public String updateImage(MultipartFile file) throws Exception {
		String realPath = session.getServletContext().getRealPath("upload");
		String email = (String)session.getAttribute("loginID");
		
		if(file.isEmpty()) {
		mpServ.deleteImage(email);
		}else {
		mpServ.updateImage(email, realPath, file);
		}
		return "redirect:/myPage/main";
	}
	
	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}