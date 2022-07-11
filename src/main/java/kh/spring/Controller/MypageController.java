package kh.spring.Controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.spring.DAO.MypageDAO;
import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.RegStdsDTO;
import kh.spring.DTO.ReplyDTO;
import kh.spring.DTO.ReviewDTO;
import kh.spring.Service.ClassService;
import kh.spring.Service.MypageService;

@Controller
@RequestMapping("/myPage/")
public class MypageController {

	@Autowired
	private HttpSession session;

	@Autowired
	private MypageService mpServ;
	
	@Autowired
	private ClassService cServ;
	
	@Autowired
	private Gson g;

	@RequestMapping("main")
	public String main(Model model) throws Exception {
		String email = (String) session.getAttribute("loginID");
		session.setAttribute("realPath", session.getServletContext().getRealPath("upload"));

		MemberDTO myinfo = mpServ.select(email); // 내 정보 보기
		
		session.setAttribute("myinfo", myinfo);

		return "/member/myPage";
	}
	
	//탭 별 요소 출력
	@ResponseBody
	@RequestMapping("list")
		public List<Map<String, Object>> boardList(int cpage, String category) {
		String email = (String) session.getAttribute("loginID");
		List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Object> list = mpServ.selectByPage(email, cpage, category);//커뮤니티 게시글 정보

		int totalPage = mpServ.totalPage(email, category);//해당 카테고리 게시글 페이지 수
		System.out.println("토탈 페이지 : " + totalPage);
		System.out.println("리스트 갯수 : " + list.size());
        map.put("list",list);
        map.put("page", totalPage);
        listMap.add(map);
        
        return listMap;
	}

	// 회원 탈퇴
	@RequestMapping("memberOut")
	public String memberOut() throws Exception {
		String email = (String) session.getAttribute("loginID");
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
		String email = (String) session.getAttribute("loginID");

		if (file.isEmpty()) {
			mpServ.deleteImage(email);
		} else {
			mpServ.updateImage(email, realPath, file);
		}
		return "redirect:/myPage/main";
	}
	
	// 등록한 클래스 상세보기
	@RequestMapping("myClass")
	public String myClass(String class_seq, Model model) throws Exception{
		List<ClassDTO> classinfo = mpServ.getClassDetail(class_seq);
		List<RegStdsDTO> regiinfo = mpServ.getRegiDetail(class_seq);
		List<ReviewDTO> classreview = mpServ.allClassReview(class_seq);
		
		model.addAttribute("classinfo",classinfo);
		model.addAttribute("regiinfo", regiinfo);
		model.addAttribute("classreview", classreview);
	
		return "/member/myPageClass";
	}
	
	// 클래스 찜 취소 기능 (ajax)
	@ResponseBody
	@RequestMapping("likeCancel")
	public int likeCancel(String parent_seq) throws Exception{	
		
		String email = (String)session.getAttribute("loginID");
		return cServ.likeCancel(email,parent_seq);
	}

	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}