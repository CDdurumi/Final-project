package DAO;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class RegStdsDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	public int regOrNot(Map<String,String> map) {
		return mybatis.selectOne("Class.regOrNot",map);
	}
	
	public int reg(Map<String,String> map) {
		return mybatis.insert("Class.reg",map);
	}
	
	public int countStds(String parent_seq) {
		return mybatis.selectOne("Class.countStds",parent_seq);
	}	
}
