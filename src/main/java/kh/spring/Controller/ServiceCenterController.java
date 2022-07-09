package kh.spring.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.search.IntegerComparisonTerm;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.NoticeDTO;
import kh.spring.Service.CenterService;

@Controller
@RequestMapping("/center/")
public class ServiceCenterController {
	
	@Autowired
	private CenterService csService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("main")
	public String main(Model model) {
		
		int cpage = 1; // 첫 페이지는 항상 고정
		String type = "notice";
		
		String pagination = csService.pagination(type, cpage);
		List<NoticeDTO> list = csService.getNoitceList(cpage);
		
		System.out.println(pagination);
		
		// 공지글 리스트 출력
		model.addAttribute("list", list);
		model.addAttribute("page", pagination);
		
		return "/center/centerList";
	}
	
	// 공지글 작성 페이지 이동
	@RequestMapping("notice-write")
	public String writeNotice(String seq) {
		return "/center/noticeWrite";
	}
	
	// 공지글 작성
	@RequestMapping("writeNotice")
	public String writeNotice(String title, String contents) {
		
		MemberDTO dto = (MemberDTO)session.getAttribute("MemberDTO");
		String nickName = dto.getNickname();
		
		csService.writeNotice(nickName, title, contents);

		return "redirect:/center/main";
	}
	
	// 공지글 페이지 이동
	@ResponseBody
	@RequestMapping("getNoticeList")
	public Map<String, Object> getNoticeList(String cpage){
		
		int targetPage = Integer.parseInt(cpage);
		String type = "notice";
		
		String pagination = csService.pagination(type, targetPage);
		List<NoticeDTO> list = csService.getNoitceList(targetPage);

		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("list",list);
		map.put("page", pagination);
		
		return map;
	}
	
	
	// 공지글 출력 : 공지사항 버튼 클릭 시
	@RequestMapping("noticeDetail")
	public String noticeDetail(String seq, Model model) {
		
		int target_seq = Integer.parseInt(seq);
		
		// 데이터 불러오기
		model.addAttribute("data", csService.getNotice(target_seq));
		
		return "/center/noticeDetail";
	}
	
	// 공지글 수정
	@RequestMapping("modifyNotice")
	public String modifyNotice(NoticeDTO dto) {
		
		csService.modifyNotice(dto);
		
		return "redirect:/center/noticeDetail?seq="+dto.getNotice_seq();
	}
	
	// 공지글 삭제
	@ResponseBody
	@RequestMapping("delNotice")
	public String deleteNotice(String notice_seq) {
		
		int target_seq = Integer.parseInt(notice_seq);
		csService.deleteNotice(target_seq);
		
		return "succes";
	}
	
	
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
