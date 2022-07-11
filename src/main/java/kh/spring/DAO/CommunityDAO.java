package kh.spring.DAO;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.MemberDTO;

@Repository
public class CommunityDAO {
	@Autowired
	private SqlSession mybatis;
	
	
	//게시글 정보 삽입(생성)
	public String insert(CommunityDTO dto) {		
		mybatis.insert("Community.insert",dto);
		return dto.getBoard_seq();
	}

	//해당 페이지의 게시글 가져오기
	public List<CommunityDTO> selectByPage(int start, int end, String category, String searchContent, String isHash) {
		Map<String, String> map = new HashMap<>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("category", category);
		map.put("searchContent", searchContent);
		map.put("isHash", isHash);

		return mybatis.selectList("Community.selectByPage",map);
	}
	
	//게시글 별 totalPage 가져오기
	public int totalPage(String category, String searchContent, String isHash) {
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("searchContent", searchContent);
		map.put("isHash", isHash);
		return mybatis.selectOne("Community.totalPage",map);
	}
	

	//게시글 정보 가져오기 by seq
	public CommunityDTO selectBySeq(String seq) {
		return mybatis.selectOne("Community.selectBySeq",seq);
	}
	
	
	//게시글 조회 수 up
	public void viewCountUp(String seq) {
		mybatis.update("Community.viewCountUp" , seq);
	}
	
	
	//게시글 수정하기
	public void update(CommunityDTO dto) {
		mybatis.update("Community.update" , dto);
	}
	
	
	
	//나중에 MemberDAO로 옮길 것!!
	//해당 멤버 정보 가져오기
	public MemberDTO selectById(String id) {
		//해당 멤버 정보 가져오기
		return mybatis.selectOne("Community.selectById",id);
	}
	
	
	
	//게시글 삭제하기
	public void delete(String seq) {
		mybatis.selectOne("Community.delete", seq);
	}	
	
	
	//도와주세요 진행여부(마감) 변경
	public void progressUpdate(String seq ,String progress ) {
		Map<String, String> map = new HashMap<>();
		map.put("seq", seq);
		map.put("progress", progress);
		mybatis.selectOne("Community.progressUpdate", map);
	}
	
	
	
	
	
	
	//게시글 더미 데이터 만들기
	public void dumy(){

		for(int i=0; i<144; i++) {
			mybatis.insert("Community.dumy",i);
		}

	}

}

