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
	public String insert(CommunityDTO dto) {		
		mybatis.insert("Community.insert",dto);
		return dto.getBoard_seq();
	}

}

