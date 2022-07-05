package kh.spring.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.MemberDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSession mybatis;

	public List<MemberDTO> selectAllMember(){
		System.out.println("DAO");
		return mybatis.selectList("Admin.selectAllMember");
	}

	
}
