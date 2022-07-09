package kh.spring.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.Service.CommunityService;

@Controller
@RequestMapping("/community/")
public class CoummunityController {
	@Autowired
	private HttpSession session;//세션
	@Autowired
	private CommunityService coServ;//커뮤니티 서버

	
	@Autowired
	private Gson g;
	//커뮤니티 메인
	@RequestMapping("main")
	public String CommunityMain() {
		return "/community/communityMain";
	}
	
	
	//글 작성 페이지
	@RequestMapping("boardWrite")
	public String boardWrite(String category, Model model) {
		model.addAttribute("category", category);
		return "/community/boardWrite";
	}
	
	//글 작성 처리
	@RequestMapping("writePro")
	public String boardWritePro(String categoryOption, CommunityDTO dto, MultipartFile[] file) throws Exception{
		dto.setWriter((String)session.getAttribute("loginID"));
		coServ.insert(categoryOption, dto, file, "insert");//게시글 생성 및 파일 업로드

		return "redirect:main";
	}
	
	
	//커뮤니티 게시글 리스트 출력
	@ResponseBody
	@RequestMapping("list")
	public String boardList(int cpage, String category, String searchContent) {
//System.out.println("페이지 : " + cpage);
		List<CommunityDTO> list = coServ.selectByPage(cpage, category, searchContent) ;//커뮤니티 게시글 정보
		int totalPage = coServ.totalPage(category, searchContent);//해당 카테고리 게시글 페이지 수

		JsonArray arr = new JsonArray();
		arr.add(g.toJson(list));
		arr.add(g.toJson(totalPage));
		return arr.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "profile", produces = "text/html; charset=UTF-8")
	public String mainImage(String parent_seq) {
//		System.out.println("여기는 대표 이미지 로직");
		String scr = "";
		ImgDTO dto = coServ.selectCoProfileByPar(parent_seq);//게시글 대표 이미지 가져오기
		if(dto != null) {
			scr = "/community/"+dto.getSys_name();
		}
		return scr;
	}

	
	//게시판 detailVeiw
	@RequestMapping("detailView")
	public String detailView(String seq, Model model) {
		CommunityDTO dto = coServ.selectBySeq(seq);//커뮤니티 테이블에서 해당 게시글 정보 가져오기
		MemberDTO mDto = coServ.selectById(dto.getWriter());//멤버 정보 가져오기
		
		model.addAttribute("dto", dto);
		model.addAttribute("mDto", mDto);

		return "/community/detailView";
	}
	
	//조회 수 up.
	@ResponseBody
	@RequestMapping("viewCount")
	public void viewCount(String seq) {
		coServ.viewCountUp(seq);
	}
	
	
	//게시글 수정하기 페이지 전환
	@RequestMapping("boardModi")
	public String boardModi(String seq, Model model) {
		CommunityDTO dto = coServ.selectBySeq(seq);//커뮤니티 테이블에서 해당 게시글 정보 가져오기
		List<ImgDTO> imgDto = coServ.selectByPSeq(seq);//해당 게시글 이미지 리스트 가져오기
		model.addAttribute("dto", dto);
		model.addAttribute("imgDto", imgDto);
		
		return "/community/boardModi";
	}
	
	//게시글 수정
	@RequestMapping("modiPro")
	public String modiPro(CommunityDTO dto, MultipartFile[] file) throws Exception{
		coServ.insert("", dto, file, "update");//게시글 생성 및 파일 업로드

		return "redirect:detailView?seq="+dto.getBoard_seq();
	}
	

	
	//기존 이미지 파일 삭제
	@ResponseBody
	@RequestMapping("imgDel")
	public void imgDel(String[] delFileList, String parent_seq ) {
		coServ.imgDel(delFileList, parent_seq);
	}
	
	
	
	
	
	
	
	//테스트
	@RequestMapping("test")
	public String test() {
		return "community/test";
	}
	//더미 데이터 만들기
	@RequestMapping("dumy")
	public String dumy() {
		coServ.dumy();
		return "redirect:main";
	}
	
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
