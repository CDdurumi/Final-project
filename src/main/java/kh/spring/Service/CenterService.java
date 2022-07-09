package kh.spring.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.spring.DAO.ServiceCenterDAO;
import kh.spring.DTO.NoticeDTO;

@Service
public class CenterService {
	
	@Autowired
	private ServiceCenterDAO scDAO;

	// 공지글 작성 서비스
	public int writeNotice(String nickName, String title, String contents) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickName", nickName);
		map.put("title", title);
		map.put("contents", contents);
		
		return scDAO.writeNotice(map);
	}
	
	// 첫 페이지 네이션 세팅 (DAO에선 페이지 수만 뽑아옴 - 동적 쿼리로 만들꺼임)
	public String pagination(String type, int cpage) {
		
		int totalData = scDAO.totalData(type);
	
		return utils.Pagination.getServicePagiantion(totalData, cpage);
	}
	
	// 공지글 기본 목록 출력 서비스 - 맨 처음 세팅

	// 첫 리스트 출력
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
	
	// 리스트들 추후 세팅 서비스
	
	// 1대1 문의글 작성 서비스
}
