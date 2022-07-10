package kh.spring.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ReportDTO;


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
	
	public Map<String,String> selectBySeqNN(String class_seq){
		return mybatis.selectOne("Class.selectBySeqNN",class_seq);
	}
	
	public List<Map<String,String>> selectByCtgPageNN(Map<String,String> map){
		return mybatis.selectList("Class.selectByCtgPageNN",map);				
	}
	
	public List<ClassDTO> selectByCtgPage(Map<String,String> map){
		return mybatis.selectList("Class.selectByCtgPage",map);
	}
	
	public int getCtgTotalCount(String category1) {
		return mybatis.selectOne("Class.getCtgTotalCount",category1);
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
	
	public int countLikes(String parent_seq) {
		return mybatis.selectOne("Class.countLikes",parent_seq);
	}
	
	public List<String> myLikeList(String email){
		return mybatis.selectList("Class.myLikeList",email);
	}
	
	// 구매 관련
	public int regOrNot(Map<String,String> map) {
		return mybatis.selectOne("Class.regOrNot",map);
	}
	
	public int reg(Map<String,String> map) {
		return mybatis.insert("Class.reg",map);
	}
	
	public int countStds(String parent_seq) {
		return mybatis.selectOne("Class.countStds",parent_seq);
	}
	
	
	// 신고 관련
	public int reportOrNot(Map<String,String> map) {
		return mybatis.selectOne("Class.reportOrNot",map);
	}
	
	public int report(ReportDTO rdto) {
		return mybatis.insert("Class.report",rdto);
	}
}
