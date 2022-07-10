package DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ReviewDTO;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class ClassDAO {
	
	// @Autowired
	private SqlSession mybatis;
	
	// AdminDAO
	// 개설한 강의 수 뽑기
	public int CountOpenClassById(String id) {
		return mybatis.selectOne("Class.CountOpenClassById",id);
	}
	
	
	// ClassDAO

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
	
	
	// MypageDAO
	// 클래스 상세보기 - class_seq로 찾기
	public List<ClassDTO> getClassDetail(String class_seq) {
		return mybatis.selectList("Class.buyClassList", class_seq);
	}
	
	// 내가 구매한 클래스 정보
	public List<ClassDTO> buyClass(String email) {
		
		List<String> list = mybatis.selectList("ClassRegstds.buyClass", email);
		List<ClassDTO> list1 = new ArrayList<>();
		
		for(String str : list) {
			String class_seq = str;
			list1.addAll(mybatis.selectList("Class.buyClassList", class_seq));
		}
		return list1;
	}
	
	// 내가 좋아요한 클래스
	public List<ClassDTO> likeClass(String email) {
		return mybatis.selectList("Class.likeClass", email);
	}
	
	// 내가 등록한 클래스 정보
	public List<ClassDTO> regClass(String email) {
		return mybatis.selectList("Class.regClass", email);
	}
	
	// 내가 작성한 리뷰의 클래스 보기
	public List<ClassDTO> reviewClass(String email) {

		List<ReviewDTO> list = mybatis.selectList("ClassRv.classReview", email);
		List<ClassDTO> list1 = new ArrayList<>();

		for (ReviewDTO dto : list) {
			list1.addAll(mybatis.selectList("Class.buyClassList", dto.getParent_seq()));
		}
		return list1;
	}
	
	
}
