package kh.spring.DAO;

import java.util.List;
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
	
	public List<Map<String,String>> selectIndex(){
		return mybatis.selectList("Class.selectIndex");
	}
	
	public ClassDTO selectBySeq(String class_seq) {
		return mybatis.selectOne("Class.selectBySeq",class_seq);
	}
	
	public Map<String,String> selectBySeqNN(String class_seq){
		return mybatis.selectOne("Class.selectBySeqNN",class_seq);
	}
	
	public List<Map<String,String>> selectByCtgPageNN(Map<String,String> map){
		return mybatis.selectList("Class.selectByCtgPageNN",map);				
	}
	
	public List<Map<String,String>> selectBySearch(Map<String,String> map){
		return mybatis.selectList("Class.selectBySearch",map);				
	}
	
	public int getCtgTotalCount(String category1) {
		return mybatis.selectOne("Class.getCtgTotalCount",category1);
	}
	
	public int getCtgSearchTotalCount(Map<String,String> map) {
		return mybatis.selectOne("Class.getCtgSearchTotalCount",map);
	}
	
	public int addLike(String class_seq) {
		return mybatis.update("Class.addLike",class_seq);
	}
	
	public int subLike(String class_seq) {
		return mybatis.update("Class.subLike",class_seq);
	}
	
	public int newStars(Map<String,Object> map) {
		return mybatis.update("Class.newStars",map);
	}
	
	public int delete(String class_seq) {
		return mybatis.delete("Class.delete",class_seq);
	}
	
	public int setStateR(String class_seq) {
		return mybatis.update("Class.setStateR",class_seq);
	}
}
