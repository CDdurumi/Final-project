package kh.spring.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DTO.CommunityDTO;
import kh.spring.Service.CommunityService;

@Controller
@RequestMapping("/community/")
public class CoummunityController {
	@Autowired
	private HttpSession session;//세션
	@Autowired
	private CommunityService coServ;
	
	//커뮤니티 메인
	@RequestMapping("main")
	public String CommunityMain() {
		return "/community/communityMain";
	}
	
	
	//글 작성 페이지
	@RequestMapping("boardWrite")
	public String boardWrite() {
		return "/community/boardWrite";
	}
	
	//글 작성 처리
	@RequestMapping("writePro")
	public String boardWritePro(String categoryOption, CommunityDTO dto, MultipartFile[] file) throws Exception{
		String realPath = session.getServletContext().getRealPath("community");
System.out.println((String)session.getAttribute("loginID"));		
		dto.setWriter((String)session.getAttribute("loginID"));
		coServ.insert(categoryOption, dto, file	, realPath);//게시글 생성 및 파일 업로드

		return "redirect:main";
	}
	
	
	
	//게시판 detailVeiw
	@RequestMapping("detailView")
	public String detailView() {
		return "/community/detailView";
	}
	
	
	//테스트
	@RequestMapping("test")
	public String test() {
		return "community/test";
	}
	
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
