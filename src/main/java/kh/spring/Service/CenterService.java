package kh.spring.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.DAO.ServiceCenterDAO;
import kh.spring.DTO.InquiryDTO;
import kh.spring.DTO.NoticeDTO;
import kh.spring.DTO.ReplyInquiryDTO;

@Service
public class CenterService {
	
	@Autowired
	private ServiceCenterDAO scDAO;
	
	@Autowired
	private HttpSession session;

	// 공지글 작성 서비스
	public int writeNotice(String nickName, String title, String contents) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickName", nickName);
		map.put("title", title);
		map.put("contents", contents);
		
		return scDAO.writeNotice(map);
	}
	
	// 공지 첫 페이지 네이션 세팅 (DAO에선 페이지 수만 뽑아온다)
	public String pagination(String type, int cpage) {
		
		int totalData = scDAO.totalData(type);
	
		return utils.Pagination.getServicePagiantion(totalData, cpage);
	}
	
	// 공지글 리스트 출력
	public List<NoticeDTO> getNoitceList(int cpage){
		
		return scDAO.getNoticeList(cpage);
	}
	
	// 공지글 출력 서비스
	@Transactional
	public NoticeDTO getNotice(int seq) {
		
		scDAO.upViewCount(seq);
		
		return scDAO.getNotice(seq);
	}
	
	// 공지글 수정 서비스
	public int modifyNotice(NoticeDTO dto) {
		
		return scDAO.modifyNotice(dto);
	}
	
	// 공지글 삭제 서비스
	public int deleteNotice(int notice_seq) {
		
		return scDAO.deleteNotice(notice_seq);
	}
	
	//////////////////////////////// 1대 1 문의 서비스/////////////////////////
	
	// 1대1 문의 페이지 네이션 세팅 (DAO에선 페이지 수만 뽑아온다)
	public String inquiryPagination(String type, int cpage) {
		
		int totalData = scDAO.totalData(type);
	
		return utils.Pagination.getInquiryPagiantion(totalData, cpage);
	}
	
	// 1대1 문의 리스트 출력
	public List<InquiryDTO> getInquiryList(int cpage){
		
		return scDAO.getInquiryList(cpage);
	}
	
	// 1대1문의글 작성
	public void writeInquiry(InquiryDTO dto) {
		// 기본값 세팅
		dto.setWriter((String)session.getAttribute("nickname"));
		dto.setEmail((String)session.getAttribute("loginID"));
		
		
		scDAO.writeInquiry(dto);
	}
	
	// 1대1문의글 출력 - 댓글도 추후 추가되어야 함.
	@Transactional
	public Map<String, Object> inquiryDetail(int seq){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		InquiryDTO dto = scDAO.inquiryDetail(seq);
		
		map.put("article", dto);
		
		// 답변처리 되어 있으면, 답변 끌어오기
		if(dto.getSts() == 1) {
			
			ReplyInquiryDTO reply = scDAO.getAnswer(seq);
			
			map.put("reply", reply);
		}
		
		return map;
	}
	
	// 문의글 수정
	public void modifyInquiry(InquiryDTO dto) {
		
		scDAO.modifyInquiry(dto);
	}
	
	// 문의글 삭제
	public int deleteInquiry(String seq) {
		
		int target_seq = Integer.parseInt(seq);
		
		return scDAO.deleteInquiry(target_seq);
		
	}
	
	// 문의글 답변 등록
	@Transactional
	public int inquiryAnswer(ReplyInquiryDTO dto) {
		
		String type = "1"; // 1 : 답변 완료 
		dto.setWriter((String)session.getAttribute("nickname"));

		// 답변 등록
		int seq = scDAO.inquiryAnswer(dto);
		
		// 문의글 답변 완료처리
		return scDAO.updateInquirySts(dto.getParent_seq(), type);
		
	}
	
	// 답변 수정
	public void modifyReply(ReplyInquiryDTO dto) {
		
		scDAO.modifyReply(dto);
	}
	
	// 답변 삭제
	@Transactional
	public void deleteReply(ReplyInquiryDTO dto) {
		
		scDAO.deleteReply(dto);
		
		scDAO.updateInquirySts(dto.getParent_seq(), "0");
	}
	
}
