package DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Pagination;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class MemberDAO {

	// @Autowired
	private SqlSession mybatis;
	
	// AdminDAO
	// 전체 회원 수(페이징)
	public int selectAllMemberCount() {
		return mybatis.selectOne("Member.selectAllMemberCount");
	}
	
	// 회원정보
	public List<MemberDTO> selectMemberByPage(Pagination page){
		return mybatis.selectList("Member.selectMemberByPage",page);
	}
	
	// CommunityDAO
	//해당 멤버 정보 가져오기
	public MemberDTO selectById(String id) {
		//해당 멤버 정보 가져오기
		return mybatis.selectOne("Member.selectById",id);
	}
	
	
	// LoginDAO
	//계정 확인 작업
	public boolean accountCheck(String email, String pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("email", email);
		map.put("pw", pw);
		
		return mybatis.selectOne("Member.pwCheck", map);
		
	}
	
	// 인증번호 전 계정 유무 확인
	public boolean accountCheckBeforeSendCode(String name, String email) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("name", name);
		map.put("email", email);
		
		return mybatis.selectOne("Member.accountCheckBeforeSendCode", map);
		
	}
	
	
	public MemberDTO getMemberDTO(String email, String pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("email", email);
		map.put("pw", pw);
		
		return mybatis.selectOne("Member.getMemberDTO", map);
	}
	
	
	
	// Email 찾기 관련 method
	// 1) 계정 유무
	public boolean isExistEmail(String name, String phone) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("name", name);
		map.put("phone", phone);
		
		return mybatis.selectOne("Member.isExistEmail", map);
		
	}
	
	// 2) 계정 정보
	public String getEmail(String name, String phone) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("name", name);
		map.put("phone", phone);
		
		MemberDTO dto = mybatis.selectOne("Member.getEmail", map);
		
		return dto.getEmail();
	}
	
	// 비밀번호 재설정
	public int resetPw(String email, String pw) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("email", email);
		map.put("pw", pw);
		
		return mybatis.update("Member.resetPw", map);
	}
	
	// MypageDAO
	// id로 회원정보 불러오기
	public MemberDTO select(String email) {
		return mybatis.selectOne("Member.select", email);
	}

	// 회원탈퇴
	public int delete(String email) {
		return mybatis.delete("Member.delete", email);
	}

	// 연락처, 닉네임만 수정
	public int updateInfo(MemberDTO dto) {
		return mybatis.update("Member.updateInfo", dto);
	}

	// 프로필 이미지 수정
	public int updateImage(String email, String sysName) {
		Map<String, String> param = new HashMap<>();
		param.put("profile_img", sysName);
		param.put("email", email);

		return mybatis.update("Member.updateImage", param);
	}

	// 프로필 이미지 삭제
	public int deleteImage(String email) {
		return mybatis.delete("Member.deleteImage", email);
	}
	
	// SignupDAO
	// 회원가입
	public int insertMember(MemberDTO dto) {
		
		System.out.println("회원가입 처리");
		
		return mybatis.insert("Member.insertMember", dto);
	}
	
	//닉네임 중복확인
	public boolean isNickname(String nickname) {
		
		String sql = "select count(*) from member where id=?";
		
		return mybatis.selectOne("Member.isNickname", nickname);
		
	}
	
	// 이메일 중복확인
	public boolean isExistEmail(String email) {
		
		return mybatis.selectOne("Member.isExistEmail",email);
		
	}
}
