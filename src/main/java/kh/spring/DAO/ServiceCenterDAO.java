package kh.spring.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.checkerframework.common.returnsreceiver.qual.This;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.InquiryDTO;
import kh.spring.DTO.NoticeDTO;
import kh.spring.DTO.ReplyInquiryDTO;

@Repository
public class ServiceCenterDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	public int writeNotice(Map map) {
		
		return mybatis.insert("CS.writeNotice", map);
	}
	// 총 페이지 수 뽑아오는 메서드 ( 공통 )
	public int totalData(String type) {
		
		return mybatis.selectOne("CS.totalData",type);
	}
	
	// 공지사항 리스트 뽑아오는 메서드
	public List<NoticeDTO> getNoticeList(int cpage) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int start = cpage*5 -4;
		int end = cpage*5;
		
		map.put("start", start);
		map.put("end", end);
		
		return mybatis.selectList("CS.getNoticeList", map);
		
	}
	
	// 공지사항 글 출력하는 메서드
	public NoticeDTO getNotice(int seq) {
		
		return mybatis.selectOne("CS.getNotice", seq);
	}
	
	// 조회수 올리는 메서드
	public void upViewCount(int seq) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("seq", seq);
		
		mybatis.update("CS.upViewCount", map);
	}
	
	// 공지글 수정 메서드
	public int modifyNotice(NoticeDTO dto) {
		
		return mybatis.update("CS.modifyNotice", dto);
	}
	
	// 공지글 삭제 메서드
	public int deleteNotice(int notice_seq) {
		
		return mybatis.delete("CS.deleteNotice", notice_seq);
	}
	
	
	/////////////////////////////1대1문의///////////////////////////////////////
	public List<InquiryDTO> getInquiryList(int cpage) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int start = cpage*5 -4;
		int end = cpage*5;
		
		map.put("start", start);
		map.put("end", end);
		
		return mybatis.selectList("CS.getInquiryList", map);
		
	}
	
	// 문의글 DB입력
	public int writeInquiry(InquiryDTO dto) {
		
		mybatis.insert("CS.writeInquiry", dto);
		
		return dto.getInquiry_seq();
	}
	
	// 문의글 출력
	public InquiryDTO inquiryDetail(int seq) {
		
		return mybatis.selectOne("CS.inquiryDetail", seq);
	}
	
	// 문의글 수정
	public int modifyInquiry(InquiryDTO dto) {
		
		return mybatis.update("CS.modifyInquiry", dto);
	}
	
	// 문의글 삭제
	public int deleteInquiry(int target_seq) {
		return mybatis.delete("CS.deleteInquiry", target_seq);
	}
	
	// 답변 등록
	public int inquiryAnswer(ReplyInquiryDTO dto) {
		
		mybatis.insert("CS.inquiryAnswer", dto);

		return dto.getReply_inquiry_seq(); 
		
	}
	
	// 문의글 답변 상태 변경
	public int updateInquirySts(int parent_seq, String type) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("seq", parent_seq);
		map.put("type", type);
		
		return mybatis.update("CS.updateInquirySts", map);
		
	}
	
	
	// 답변 출력
	public ReplyInquiryDTO getAnswer(int parent_seq) {
		
		return mybatis.selectOne("CS.getAnswer", parent_seq);
		
	}
	
	// 답변 수정
	public int modifyReply(ReplyInquiryDTO dto) {
		
		return mybatis.update("CS.modifyReply", dto);
	}
	
	// 답변 삭제
	public int deleteReply(ReplyInquiryDTO dto) {
		
		return mybatis.delete("CS.deleteReply", dto);
	}
}
