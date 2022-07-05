package kh.spring.DAO;

import java.util.HashMap;
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
	public String insert(CommunityDTO dto, String categoryOption) {
		Map<String, String> map = new HashMap<>();
		
		String sequence = "";
		if(categoryOption.equals("q")) {//궁금해요
			sequence = "'q'||question_seq" ;
		}else if(categoryOption.equals("h")){//도와주세요
			sequence = "'h'||help_seq"  ;
		}else if(categoryOption.equals("s")){//도와드려요
			sequence = "'s'||support_seq"  ;
		}else if(categoryOption.equals("d")){//일상
			sequence = "'d'||daily_seq"  ;
		}

		map.put("board_seq", sequence);
		map.put("writer", dto.getWriter());
		map.put("hash_tag",dto.getHash_tag());
		map.put("title",dto.getTitle());
		map.put("contents",dto.getContents());
		mybatis.insert("Community.insert",map);
		return dto.getBoard_seq();
	}

}

