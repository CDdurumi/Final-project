package kh.spring.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/center/")
public class ServiceCenterController {
	
	@RequestMapping("main")
	public String main() {
		return "/center/centerList";
	}
	
	// 공지글 작성 페이지 이동
	@RequestMapping("notice-write")
	public String writeNotice() {
		return "/center/noticeWrite";
	}
	
	// 공지글 작성
	
	
	// 공지글 출력
	@RequestMapping("noticeDetail")
	public String noticeDetail() {
		
		return "/center/noticeDetail";
	}
	
	// 공지글 수정
	
	
	// 공지글 삭제
	
	// 문의글 작성 페이지 이동
	@RequestMapping("inquiry")
	public String inquiry() {
		return "/center/inquiryWrite";
	}
	
	// 문의글 작성
	
	
	// 문의글 출력 (댓글 포함)
	@RequestMapping("inquiryDetail")
	public String inquiryDetail() {
		
		return "/center/inquiryDetail";
	}
	
	// 문의글 삭제
	
	
	// 문의글 수정
	
	
	// 답변 등록
	
	
	// 답변 수정
	
	
	// 답변 삭제
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();

		return "error";
	}

}
