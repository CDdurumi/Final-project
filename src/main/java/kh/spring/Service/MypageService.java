package kh.spring.Service;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DAO.MypageDAO;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.RegStdsDTO;
import kh.spring.DTO.ReplyDTO;
import kh.spring.DTO.ReviewDTO;
import utils.EncryptUtils;

@Service
public class MypageService {

	@Autowired
	private HttpSession session;

	@Autowired
	private MypageDAO dao;

	public MemberDTO select(String email) {
		return dao.select(email);
	}

	// 연락처, 닉네임만 수정
	public int updateInfo(MemberDTO dto) {
		return dao.updateInfo(dto);
	}

	// 프로필 이미지 수정
	public int updateImage(String email, String realPath, MultipartFile file) throws Exception {

		File realPathFile = new File(realPath); // 업로드 경로를 파일 객체로 생성하여
		if (!realPathFile.exists())
			realPathFile.mkdir(); // 경로가 존재하지 않는다면 생성

		String oriName = file.getOriginalFilename();
		String sysName = UUID.randomUUID() + "_" + oriName; // 중복되지 않는 임의의 값 + _ + 파일의 원래 이름
		file.transferTo(new File(realPath + "/" + sysName)); // 임시 저장소에 보관된 파일을 realPath 밑 sysName이라는 이름으로 전송 요청
		session.setAttribute("profile_img", sysName);

		return dao.updateImage(email, sysName);
	}

	// 프로필 이미지 삭제
	public int deleteImage(String email) {
		session.removeAttribute("profile_img");
		return dao.deleteImage(email);
	}

	// 현재 비밀번호 확인
	public int currentpwChk(String password) {
		String email = (String) session.getAttribute("loginID");
		String encryptPw = EncryptUtils.SHA256(password);
		return dao.currentpwChk(email, encryptPw);
	}
	
	// 비밀번호 변경
	public int pwChange(String password) {
		String email = (String) session.getAttribute("loginID");
		String encryptPw = EncryptUtils.SHA256(password);
		return dao.pwChange(email, encryptPw);
	}

	// 회원 탈퇴
	public int delete(String email) {
		return dao.delete(email);
	}

	public byte[] getFileContents(String realPath, String sys_name) throws Exception {
		File targetFile = new File(realPath + "/" + sys_name);
		try (DataInputStream dis = new DataInputStream(new FileInputStream(targetFile))) {
			byte[] fileContents = new byte[(int) targetFile.length()];
			dis.readFully(fileContents);
			return fileContents;
		}
	}

	// 내가 구매한 클래스 상세 페이지
	public List<Object> myBuyClass(String class_seq) {
		return dao.myBuyClass(class_seq);
	}

	// 내가 등록한 클래스의 수강신청인원
	public List<Object> getStdCount(String email, int cpage) {
		int start = (cpage - 1) * 5 + 1;// 해당 페이지의 첫 게시글 번호
		int end = cpage * 5;// 해당 페이지의 끝 게시글 번호
		return dao.getStdCount(email, start, end);
	}

	// 클래스 상세보기 - class_seq로 찾기
	public List<ClassDTO> getClassDetail(String class_seq) {
		return dao.getClassDetail(class_seq);
	}

	// 클래스 상세보기 - 클래스 등록현황
	public List<RegStdsDTO> getRegiDetail(String class_seq) {
		return dao.getRegiDetail(class_seq);
	}

	// 클래스 상세보기 - 내가 등록한 클래스의 리뷰
	public List<ReviewDTO> allClassReview(String parent_seq) {
		return dao.allClassReview(parent_seq);
	}

	// 마이페이지 메인 화면 사용 - 구매한 클래스
	public List<Object> buyClassList(String email) {
		return dao.buyClassList(email);
	}

	// 마이페이지 메인 화면 사용 - 구매한 클래스의 사진
	public List<ImgDTO> mainPicList(String parent_seq) {
		return dao.mainPicList(parent_seq);
	}

	// 마이페이지 메인 화면 사용 - 내가 작성한 커뮤니티 글
	public List<CommunityDTO> getPostList(String email) {
		return dao.getPostList(email);
	}

	// 마이페이지 메인 화면 사용 - 내가 작성한 커뮤니티 글의 댓글수
	public List<Integer> getReplyCount(String email) {
		return dao.getReplyCount(email);
	}

	// 마이페이지 메인 화면 사용 - 내가 작성한 댓글
	public List<ReplyDTO> getReplyList(String email) {
		return dao.getReplyList(email);
	}

	// 마이페이지 메인 화면 사용 - 내가 작성한 댓글의 본문
	public List<CommunityDTO> replyPostList(String email) {
		return dao.replyPostList(email);
	}

	// 각 탭 정보 인피니트 스크롤 적용
	public List<Object> selectByPage(String email, int cpage, String category) {
		int start = (cpage - 1) * 5 + 1;// 해당 페이지의 첫 게시글 번호
		int end = cpage * 5;// 해당 페이지의 끝 게시글 번호
		return dao.selectByPage(email, start, end, category);
	}

	// 각 탭 이미지
	public List<ImgDTO> picList(String email, int cpage, String category) {
		int start = (cpage - 1) * 5 + 1;// 해당 페이지의 첫 게시글 번호
		int end = cpage * 5;// 해당 페이지의 끝 게시글 번호
		return dao.picList(email, start, end, category);
	}

	// 탭 totalPage
	public int totalPage(String email, String category) {
		int result = 0;
		if (category.equals("t1")) {
			result = dao.buyClass(email).size();
		} else if (category.equals("t2")) {
			result = dao.likeClass(email).size();
		} else if (category.equals("t3")) {
			result = dao.regClass(email).size();
		} else if (category.equals("t4")) {
			result = dao.classReview(email).size();
		} else if (category.equals("c1")) {
			result = dao.viewPost(email).size();
		} else if (category.equals("c2")) {
			result = dao.viewReply(email).size();
		}
		return result;
	}
}
