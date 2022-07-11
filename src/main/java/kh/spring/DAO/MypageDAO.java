package kh.spring.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.RegistrationDTO;
import kh.spring.DTO.ReplyDTO;
import kh.spring.DTO.ClassReviewDTO;

@Repository
public class MypageDAO {

	@Autowired
	private SqlSession mybatis;

	// id로 회원정보 불러오기
	public MemberDTO select(String email) {
		return mybatis.selectOne("Mypage.select", email);
	}

	// 회원탈퇴
	public int delete(String email) {
		return mybatis.delete("Mypage.delete", email);
	}

	// 연락처, 닉네임만 수정
	public int updateInfo(MemberDTO dto) {
		return mybatis.update("Mypage.updateInfo", dto);
	}

	// 프로필 이미지 수정
	public int updateImage(String email, String sysName) {
		Map<String, String> param = new HashMap<>();
		param.put("profile_img", sysName);
		param.put("email", email);

		return mybatis.update("Mypage.updateImage", param);
	}

	// 프로필 이미지 삭제
	public int deleteImage(String email) {
		return mybatis.delete("Mypage.deleteImage", email);
	}

	// 클래스 상세보기 - class_seq로 찾기
	public List<ClassDTO> getClassDetail(String class_seq) {
		return mybatis.selectList("Mypage.buyClassList", class_seq);
	}

	// 클래스 등록현황
	public List<RegistrationDTO> getRegiDetail(String class_seq) {
		return mybatis.selectList("Mypage.getRegiDetail", class_seq);
	}

	// 내가 구매한 클래스 정보
	public List<ClassDTO> buyClass(String email) {

//		List<String> list = mybatis.selectList("Mypage.buyClass", email);
//		List<ClassDTO> list1 = new ArrayList<>();
//
//		for (String str : list) {
//			String class_seq = str;
//			list1.addAll(mybatis.selectList("Mypage.buyClassList", class_seq));
//		}
//		return list1;
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.buyClass", map);
	}

	// 클래스 구매일
	public List<String> buyClassDate(String email) {
		return mybatis.selectList("Mypage.buyClassDate", email);
	}

	// 내가 좋아요한 클래스
	public List<ClassDTO> likeClass(String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.likeClass", map);
	}

	// 내가 등록한 클래스 정보
	public List<ClassDTO> regClass(String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.regClass", map);
	}

	// 내가 작성한 리뷰
	public List<ClassReviewDTO> classReview(String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.classReview", map);
	}

	// 내가 작성한 리뷰의 클래스 보기
//	public List<ClassDTO> reviewClass(String email) {
//
//		List<ClassReviewDTO> list = mybatis.selectList("Mypage.classReview", email);
//		List<ClassDTO> list1 = new ArrayList<>();
//
//		for (ClassReviewDTO dto : list) {
//			list1.addAll(mybatis.selectList("Mypage.buyClassList", dto.getParent_seq()));
//		}
//		return list1;
//	}

	// 내가 작성한 커뮤니티 글 보기
	public List<CommunityDTO> viewPost(String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.viewPost", map);
	}

	// 내가 작성한 커뮤니티 글의 댓글수 가져오기
	public List<Integer> getReplyCount(String email) {

		List<CommunityDTO> list = mybatis.selectList("Mypage.viewPost", email);
		List<Integer> list1 = new ArrayList<>();

		for (CommunityDTO dto : list) {
			list1.addAll(mybatis.selectList("Mypage.getReplyCount", dto.getBoard_seq()));
		}
		return list1;
	}

	// 내가 작성한 댓글 보기
	public List<ReplyDTO> viewReply(String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.viewReply", map);
	}

	// 내가 댓글을 작성한 게시글 보기
//	public List<CommunityDTO> replyPost(String email) {
//
//		List<ReplyDTO> list = mybatis.selectList("Mypage.viewReply", email);
//		List<CommunityDTO> list1 = new ArrayList<>();
//
//		for (ReplyDTO dto : list) {
//			list1.addAll(mybatis.selectList("Mypage.replyPost", dto.getBoard_seq()));
//		}
//		return list1;
//	}

	// 내가 등록한 클래스의 리뷰 모두 보기
	public List<ClassReviewDTO> allClassReview(String parent_seq) {
		return mybatis.selectList("Mypage.allClassReview", parent_seq);
	}

	// 내가 등록한 클래스의 리뷰수, 별점 평균 가져오기
//	public List<Map<String, String>> reviewDetail(String email) {
//
//		List<ClassDTO> list = mybatis.selectList("Mypage.regClass", email);
//		List<Map<String, String>> result = new ArrayList<>();
//
//		for (ClassDTO dto : list) {
//			result.addAll(mybatis.selectList("Mypage.reviewdetail", dto.getClass_seq()));
//		}
//		return result;
//	}

	// 내가 등록한 클래스의 수강 신청 인원 보기
//	public List<Integer> myClassStds(String email) {
//
//		List<ClassDTO> list = mybatis.selectList("Mypage.regClass", email);
//		List<Integer> list1 = new ArrayList<>();
//
//		for (ClassDTO dto : list) {
//			list1.addAll(mybatis.selectList("Mypage.myClassStds", dto.getClass_seq()));
//		}
//		return list1;
//	}

	public List<Object> selectByPage(String email, int start, int end, String category) {
//	public void selectByPage(String email, int start, int end, String category) {	
		if (category.equals("t1")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
	
			List<Object> list = mybatis.selectList("Mypage.buyClass", map);
			return list;
		}else if (category.equals("t2")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
	
			List<Object> list = mybatis.selectList("Mypage.likeClass", map);
			return list;
		}else if (category.equals("t3")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
	
			List<Object> list = mybatis.selectList("Mypage.regClass", map);
			return list;
		}else if (category.equals("t4")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
	
			List<Object> list = mybatis.selectList("Mypage.classReview", map);
			return list;
		}else if (category.equals("c1")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
	
			List<Object> list = mybatis.selectList("Mypage.viewPost", map);
			return list;
		}else if (category.equals("c2")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
	
			List<Object> list = mybatis.selectList("Mypage.viewReply", map);
			return list;
		}
		return null;
	}
}
