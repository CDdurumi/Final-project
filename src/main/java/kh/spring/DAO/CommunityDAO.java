package kh.spring.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.CommunityDTO;

@Repository
public class CommunityDAO {
	@Autowired
	private SqlSession mybatis;
	
	
	//게시글 정보 삽입(생성)
	public String insert(CommunityDTO dto) {		
		mybatis.insert("Community.insert",dto);
		return dto.getBoard_seq();
	}

	//해당 페이지의 댓글 가져오기
	public List<CommunityDTO> selectByPage(int start, int end, String category, String searchContent) {
		Map<String, String> map = new HashMap<>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("category", category);
		map.put("searchContent", searchContent);

		return mybatis.selectList("Community.selectByPage",map);
	}
	
	//게시글 별 totalPage 가져오기
	public int totalPage(String category) {
		return mybatis.selectOne("Community.totalPage",category);
	}
	

	
	
	//게시글 더미 데이터 만들기
	public void dumy(){

		for(int i=0; i<144; i++) {
			mybatis.insert("Community.dumy",i);
		}

	}

}

