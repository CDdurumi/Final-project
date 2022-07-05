package kh.spring.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ClassDTO;


@Repository
public class ClassDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	public int getNextSeq() {
		return mybatis.selectOne("Class.nextSeq");
	}
	
	public int insert(ClassDTO cdto){
		return mybatis.insert("Class.insert",cdto);
	}
}
