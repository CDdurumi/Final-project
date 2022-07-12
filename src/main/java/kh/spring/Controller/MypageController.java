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
import kh.spring.DTO.ImgDTO;
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

		MemberDTO myinfo = mpServ.select(email); // 메인 - 내 정보
		List<ClassDTO> buyclasslist = mpServ.buyClassList(email); // 메인 - 내가 구매한 클래스
		List<CommunityDTO> getpostlist = mpServ.getPostList(email); // 메인 - 내가 쓴 글
		List<Integer> getreplycount = mpServ.getReplyCount(email); // 메인 - 내가 쓴 글의 댓글수
		List<ReplyDTO> getreplylist = mpServ.getReplyList(email); // 메인 - 내가 작성한 댓글
		List<CommunityDTO> replypostlist = mpServ.replyPostList(email); // 메인 - 내가 작성한 댓글의 본문
		List<ImgDTO> mainpiclist = mpServ.mainPicList(email);
		
		session.setAttribute("myinfo", myinfo);
		model.addAttribute("buyclasslist", buyclasslist);
		model.addAttribute("getpostlist", getpostlist);
		model.addAttribute("getreplycount", getreplycount);
		model.addAttribute("getreplylist", getreplylist);
		model.addAttribute("replypostlist", replypostlist);
		model.addAttribute("mainpiclist", mainpiclist);
		
		return "/member/myPage";
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

	// 회원 탈퇴
	@RequestMapping("memberOut")
	public String memberOut() throws Exception {
		String email = (String) session.getAttribute("loginID");
		mpServ.delete(email);
		session.invalidate();
		return "redirect:/";
	}

	// 탭 별 요소 출력
	@ResponseBody
	@RequestMapping("list")
	public List<Map<String, Object>> boardList(int cpage, String category) {
		String email = (String) session.getAttribute("loginID");
		List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();

		int totalPage = mpServ.totalPage(email, category);
		List<Object> list = mpServ.selectByPage(email, cpage, category);

		System.out.println("토탈 페이지 : " + totalPage);
		System.out.println("리스트 갯수 : " + list.size());

		map.put("page", totalPage);
		map.put("list", list);

		if (!category.equals("c2")) {
			List<ImgDTO> piclist = mpServ.picList(email, cpage, category);
			System.out.println("사진 갯수 : " + piclist.size());
			map.put("piclist", piclist);
		}

		listMap.add(map);

		return listMap;
	}

	// 등록한 클래스 상세보기
	@RequestMapping("myClass")
	public String myClass(String class_seq, Model model) throws Exception {
		List<ClassDTO> classinfo = mpServ.getClassDetail(class_seq);
		List<RegStdsDTO> regiinfo = mpServ.getRegiDetail(class_seq);
		List<ReviewDTO> classreview = mpServ.allClassReview(class_seq);

		model.addAttribute("classinfo", classinfo);
		model.addAttribute("regiinfo", regiinfo);
		model.addAttribute("classreview", classreview);

		return "/member/myPageClass";
	}

	// 클래스 찜 취소 기능 (ajax)
	@ResponseBody
	@RequestMapping("likeCancel")
	public int likeCancel(String parent_seq) throws Exception {

		String email = (String) session.getAttribute("loginID");
		return cServ.likeCancel(email, parent_seq);
	}

	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}