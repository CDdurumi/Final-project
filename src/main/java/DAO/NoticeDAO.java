package DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.DTO.NoticeDTO;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class NoticeDAO {

	
	// @Autowired
	private SqlSession mybatis;
	
	public int writeNotice(Map map) {
		
		return mybatis.insert("Notice.writeNotice", map);
	}
	// 총 페이지 수 뽑아오는 메서드
	public int totalData(String type) {
		
		return mybatis.selectOne("Notice.totalData",type);
	}
	
	// 공지사항 리스트 뽑아오는 메서드
	public List<NoticeDTO> getNoticeList(int cpage) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int start = cpage*5 -4;
		int end = cpage*5;
		
		map.put("start", start);
		map.put("end", end);
		
		return mybatis.selectList("Notice.getNoticeList", map);
		
	}
	
	// 공지사항 글 출력하는 메서드
	public NoticeDTO getNotice(int seq) {
		
		return mybatis.selectOne("Notice.getNotice", seq);
	}
	
	// 조회수 올리는 메서드
	public void upViewCount(int seq) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("seq", seq);
		
		mybatis.update("Notice.upViewCount", map);
	}
	
	// 공지글 수정 메서드
	public int modifyNotice(NoticeDTO dto) {
		
		return mybatis.update("Notice.modifyNotice", dto);
	}
	
	// 공지글 삭제 메서드
	public int deleteNotice(int notice_seq) {
		
		return mybatis.delete("Notice.deleteNotice", notice_seq);
	}
}
