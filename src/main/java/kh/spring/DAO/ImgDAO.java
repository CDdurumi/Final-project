package kh.spring.DAO;

import java.util.List;

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
	
	// parentSeq로 이미지 목록 출력
	public List<ImgDTO> selectByPSeq(String parent_seq){
		return mybatis.selectList("Img.selectByPSeq",parent_seq);
	}
	
	// parentSeq로 메인 이미지 1장 출력 (클래스)
	public ImgDTO selectMByPSeq(String parent_seq) {
		return mybatis.selectOne("Img.selectMByPSeq",parent_seq);
	}
	
	// 커뮤니티 parentSeq 메인 이미지 1장 출력
	public ImgDTO selectCoProfileByPar(String parent_seq) {
		return mybatis.selectOne("Img.selectCoProfileByPar",parent_seq);
	}
}
