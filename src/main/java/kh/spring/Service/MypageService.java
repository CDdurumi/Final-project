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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DAO.MypageDAO;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.RegistrationDTO;
import kh.spring.DTO.ReplyDTO;
import kh.spring.DTO.ClassReviewDTO;

@Service
public class MypageService {

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

		return dao.updateImage(email, sysName);
	}

	// 프로필 이미지 삭제
	public int deleteImage(String email) {
		return dao.deleteImage(email);
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

	// 클래스 상세보기
	public List<ClassDTO> getClassDetail(String class_seq) {
		return dao.getClassDetail(class_seq);
	}

	// 클래스 등록현황
	public List<RegistrationDTO> getRegiDetail(String class_seq) {
		return dao.getRegiDetail(class_seq);
	}

	// 내가 구매한 클래스
//	public List<ClassDTO> buyClass(String email) {
//		return dao.buyClass(email);
//	}

	// 클래스 구매일
//	public List<String> buyClassDate(String email) {
//		return dao.buyClassDate(email);
//	}

	// 내가 좋아요한 클래스
	public List<ClassDTO> likeClass(String email) {
		return dao.likeClass(email);
	}

	// 내가 등록한 클래스
	public List<ClassDTO> regClass(String email) {
		return dao.regClass(email);
	}

	// 내가 작성한 리뷰
	public List<ClassReviewDTO> classReview(String email) {
		return dao.classReview(email);
	}

	// 내가 작성한 리뷰의 클래스 정보 보기
//	public List<ClassDTO> reviewClass(String email) {
//		return dao.reviewClass(email);
//	}

	// 내가 작성한 커뮤니티 글 보기
	public List<CommunityDTO> viewPost(String email) {
		return dao.viewPost(email);
	}

	// 내가 작성한 댓글 보기
	public List<ReplyDTO> viewReply(String email) {
		return dao.viewReply(email);
	}

	// 내가 댓글을 작성한 게시글 보기
//	public List<CommunityDTO> replyPost(String email) {
//		return dao.replyPost(email);
//	}

	// 내가 작성한 커뮤니티 글의 댓글수 가져오기
	public List<Integer> getReplyCount(String email) {
		return dao.getReplyCount(email);
	}

	// 내가 등록한 클래스의 리뷰 모두 보기
	public List<ClassReviewDTO> allClassReview(String parent_seq) {
		return dao.allClassReview(parent_seq);
	}

	// 내가 등록한 클래스의 리뷰수, 별점 평균 가져오기
//	public List<Map<String, String>> reviewDetail(String email) {
//		return dao.reviewDetail(email);
//	}

	// 내가 등록한 클래스의 수강 신청 인원 가져오기
//	public List<Integer> myClassStds(String email) {
//		return dao.myClassStds(email);
//	}

	// 클래스탭..?
	public List<Object> selectByPage(String email, int cpage, String category) {
//	public void selectByPage(String email, int cpage, String category) throws Exception{
//	List<Map<String, String>> list1 = new ArrayList<Map<String,String>>();

		int start = (cpage - 1) * 5 + 1;// 해당 페이지의 첫 게시글 번호
		int end = cpage * 5;// 해당 페이지의 끝 게시글 번호
		return dao.selectByPage(email, start, end, category);
	}

	// 클래스탭 totalPage 가져오기
	public int totalPage(String email, String category) {
		int result = 0;
		if (category.equals("t1")) {
			result = dao.buyClass(email).size();
		}else if (category.equals("t2")) {
			result = dao.likeClass(email).size();
		}else if (category.equals("t3")) {
			result = dao.regClass(email).size();
		}else if (category.equals("t4")) {
			result = dao.classReview(email).size();
		}else if (category.equals("c1")) {
			result = dao.viewPost(email).size();
		}else if (category.equals("c2")) {
			result = dao.viewReply(email).size();
		}return result;
	}
}
