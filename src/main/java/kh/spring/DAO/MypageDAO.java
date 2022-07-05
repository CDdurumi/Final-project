package kh.spring.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Reply1DTO;
import kh.spring.DTO.Review1DTO;

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

	// 내가 등록한 클래스 정보
	public List<ClassDTO> regClass(String email) {
		return mybatis.selectList("Mypage.regClass", email);
	}

	// 내가 구매한 클래스 정보
	public List<ClassDTO> buyClass(String email) {

		List<ClassDTO> list = new ArrayList<>();

		for (int i = 0; i < mybatis.selectList("Mypage.buyClass", email).size(); i++) {
			String class_seq = (String) mybatis.selectList("Mypage.buyClass", email).get(i);
			list.addAll(mybatis.selectList("Mypage.buyClassList", class_seq));
		}
		return list;
	}

	// 클래스 구매일
	public List<String> buyClassDate(String email) {
		return mybatis.selectList("Mypage.buyClassDate", email);
	}

	// 내가 작성한 리뷰
	public List<Review1DTO> classReview(String email) {

		List<Review1DTO> list = mybatis.selectList("Mypage.classReview", email);
		return list;
	}

	// 내가 작성한 리뷰의 클래스 보기
	public List<ClassDTO> reviewClass(String email) {

		List<Review1DTO> list = mybatis.selectList("Mypage.classReview", email);
		List<ClassDTO> list1 = new ArrayList<ClassDTO>();
		for (int i = 0; i < list.size(); i++) {
			list1.addAll(mybatis.selectList("Mypage.buyClassList", list.get(i).getParent_seq()));
		}
		return list1;
	}

	// 내가 작성한 커뮤니티 글 보기
	public List<CommunityDTO> viewPost(String email) {
		return mybatis.selectList("Mypage.viewPost", email);
	}

	// 내가 작성한 댓글 보기
	public List<Reply1DTO> viewReply(String email) {
		return mybatis.selectList("Mypage.viewReply", email);
	}
	
	// 내가 댓글을 작성한 게시글 보기
	public List<CommunityDTO> replyPost(String email) {

		List<Reply1DTO> list = mybatis.selectList("Mypage.viewReply", email);
		List<CommunityDTO> list1 = new ArrayList<CommunityDTO>();
		for (int i = 0; i < list.size(); i++) {
			list1.addAll(mybatis.selectList("Mypage.replyPost", list.get(i).getParent_seq()));
		}
		return list1;
	}
	
	// 내가 작성한 커뮤니티 글의 댓글수 가져오기
	public List<Integer> getReplyCount(String email) {
		
		List<CommunityDTO> list = mybatis.selectList("Mypage.viewPost", email);
		List<Integer> list1 = new ArrayList<Integer>();
		for (int i = 0; i < list.size(); i++) {
			list1.addAll(mybatis.selectList("Mypage.getReplyCount", list.get(i).getBoard_seq()));
		}
		return list1;
	}
}
