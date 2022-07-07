package kh.spring.Controller;

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


import kh.spring.DAO.MypageDAO;
import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.RegistrationDTO;
import kh.spring.DTO.ReplyDTO;
import kh.spring.DTO.ClassReviewDTO;
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

	@RequestMapping("main")
	public String main(Model model) throws Exception {
		String email = (String) session.getAttribute("loginID");
		session.setAttribute("realPath", session.getServletContext().getRealPath("upload"));

		MemberDTO myinfo = mpServ.select(email); // 내 정보 보기
		List<ClassDTO> buyclist = mpServ.buyClass(email); // 내가 구매한 클래스 보기
		List<String> buydaylist = mpServ.buyClassDate(email); // 클래스 구매일
		List<ClassDTO> likeclass = mpServ.likeClass(email); // 내가 좋아요한 클래스 보기
		List<ClassDTO> rgclist = mpServ.regClass(email); // 내가 등록한 클래스 보기
		List<ClassReviewDTO> reviewlist = mpServ.classReview(email); // 내가 작성한 리뷰 보기
		List<ClassDTO> reviewclist = mpServ.reviewClass(email); // 내가 작성한 리뷰의 클래스 정보 보기
		List<CommunityDTO> postlist = mpServ.viewPost(email); // 내가 작성한 게시글 보기
		List<ReplyDTO> replylist = mpServ.viewReply(email); // 내가 작성한 댓글 보기
		List<CommunityDTO> replyplist = mpServ.replyPost(email); // 내가 댓글을 작성한 게시글 보기
		List<Integer> replycount = mpServ.getReplyCount(email); // 내가 작성한 게시글의 댓글수
		List<Map<String, String>> reviewdetail = mpServ.reviewDetail(email);
		List<Integer> myClassStds = mpServ.myClassStds(email);
		
		session.setAttribute("myinfo", myinfo);
		model.addAttribute("buyclist", buyclist);
		model.addAttribute("buydaylist", buydaylist);
		model.addAttribute("likeclass", likeclass);
		model.addAttribute("rgclist", rgclist);
		model.addAttribute("reviewdetail", reviewdetail);
		model.addAttribute("reviewlist", reviewlist);
		model.addAttribute("reviewclist", reviewclist);
		model.addAttribute("postlist", postlist);
		model.addAttribute("replylist", replylist);
		model.addAttribute("replyplist", replyplist);
		model.addAttribute("replycount", replycount);
		model.addAttribute("myClassStds", myClassStds);

		return "/member/myPage";
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
	
	@RequestMapping("myClass")
	public String myClass(String class_seq, Model model) throws Exception{
		List<ClassDTO> classinfo = mpServ.getClassDetail(class_seq);
		List<RegistrationDTO> regiinfo = mpServ.getRegiDetail(class_seq);
		List<ClassReviewDTO> classreview = mpServ.allClassReview(class_seq);
		
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