package kh.spring.DAO;

import java.util.HashMap;
import java.util.List;
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
	
	//기존 이미지 파일 삭제하기(커뮤니티-수정)
	public void delBySysname(String[] delFileList, String parent_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("parent_seq", parent_seq);
		map.put("sys_name", delFileList);
		mybatis.delete("Img.delBySysname",map);
	}
	
	
	//parentSeq에 해당하는 이미지 목록 삭제하기
	public void deleteByPSeq(String parente_seq) {
		mybatis.delete("Img.deleteByPSeq", parente_seq);
	}
	
	//커뮤니티에서 해당 이메일로 작성한 게시글에 대한 이미지 리스트
	public List<ImgDTO> comImgListByEmail(String email) {
		return mybatis.selectList("Img.comImgListByEmail",email);
	}
	
	//해당 이메일에 대한 게시글들 이미지 목록 삭제하기	
	public void delByEmail(String email) {
		mybatis.delete("Img.delByEmail",email);
	}
	
	
	
}
