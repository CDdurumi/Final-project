package kh.spring.DAO;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ImgDTO;

@Repository
public class ImgDAO {
	@Autowired
	private SqlSession mybatis;
	
	//삽입
	public int insert(ImgDTO dto) {		
		return mybatis.insert("Img.insert",dto);
	}
}
