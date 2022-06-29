package kh.spring.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community/")
public class CoummunityController {

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
	
	
	//게시판 detailVeiw
	@RequestMapping("detailView")
	public String detailView() {
		return "/community/detailView";
	}
	
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
