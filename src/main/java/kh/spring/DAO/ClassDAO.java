package kh.spring.DAO;

import java.util.Map;

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
	
	public ClassDTO selectBySeq(String class_seq) {
		return mybatis.selectOne("Class.selectBySeq",class_seq);
	}
	
	
	// 찜 관련
	public int likeOrNot(Map<String,String> map) {
		return mybatis.selectOne("Class.likeOrNot",map);
	}
	
	public int like(Map<String,String> map) {
		return mybatis.insert("Class.like",map);
	}
	
	public int likeCancel(Map<String,String> map) {
		return mybatis.delete("Class.likeCancel",map);
	}
	
	
	// 구매 관련
	public int regOrNot(Map<String,String> map) {
		return mybatis.selectOne("Class.regOrNot",map);
	}
	
	public int reg(Map<String,String> map) {
		return mybatis.insert("Class.reg",map);
	}
}
