package kh.spring.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	
	//글 작성 처리
	@RequestMapping("writePro")
	public String boardWritePro(MultipartFile[] file) {
		System.out.println("테스트");
		
//		System.out.println(file[0].getOriginalFilename());
		
		for(MultipartFile mf : file) {
			String ori_name = mf.getOriginalFilename();
			System.out.println(ori_name);
	}

		
		return "redirect:community";
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
