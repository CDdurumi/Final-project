package kh.spring.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ReportDTO;

@Repository
public class ReportDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	public int report(ReportDTO rdto) {
		return mybatis.insert("Report.report",rdto);
	}
	
	
	//조건에 따른 신고 수 뽑기
	public int reportCoutnByCon(Map<String, Object> param) {
		return mybatis.selectOne("Report.reportCoutnByCon", param);
	}
	
	//조건에 따른 신고 리스트 뽑기
	public List<ReportDTO> selectReportList(Map<String,Object> param,int start,int end){
		param.put("start", start);
		param.put("end", end);
		return mybatis.selectList("Report.selectReportList",param);
	}
	
	public void reportToReject(String[] rtArr) {
		
		List<String> rejectParent = new ArrayList<String>();//부모 seq 담을 리스트
		for(String report_seq: rtArr) {
			String parent_seq = mybatis.selectOne("Report.selectParentByseq",report_seq);//parent_seq찾기
			mybatis.update("Report.reportStateToReject",report_seq);//report table 상태 '0'으로 변경
			rejectParent.add(parent_seq);
		}
		
		for(String parent_seq:rejectParent) {
			mybatis.update("Report.BoardStateToReject",parent_seq);
		}
	}
}
