package kh.spring.DAO;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	//신고 하기(정보 삽입)
	public int report(ReportDTO rdto) {
		return mybatis.insert("Report.report",rdto);
	}
	

	//조건에 따른 신고 수 뽑기
	public int reportCoutnByCon(Map<String, Object> param) {
		return mybatis.selectOne("Report.reportCoutnByCon", param);
	}
	
	//조건에 따른 신고 리스트 뽑기
	public List<Map<String,String>> selectReportList(Map<String,Object> param,int start,int end){
		param.put("start", start);
		param.put("end", end);
		return mybatis.selectList("Report.selectReportList",param);
	}
	
	
	//신고리스트 반려
	public void reportToReject(String[] rtArr) {
		
		List<String> rejectParent = new ArrayList<String>();//부모 seq 담을 리스트
		for(String report_seq: rtArr) {
			if(!report_seq.equals("selectAll")) {
			String parent_seq = mybatis.selectOne("Report.selectParentByseq",report_seq);//parent_seq찾기
			mybatis.update("Report.reportStateToReject",report_seq);//report table 상태 '0'으로 변경
			rejectParent.add(parent_seq);
			}
		}
		
		for(String parent_seq:rejectParent) {
			mybatis.update("Report.boardStateToReject",parent_seq);
		}
	}
	
	//신고리스트 선택 삭제
	public void reportSelectDelete(String[] rtArr) {
		List<String> rejectParent = new ArrayList<String>();//부모 seq 담을 리스트
		for(String report_seq: rtArr) {
			if(!report_seq.equals("selectAll")) {
				String parent_seq = mybatis.selectOne("Report.selectParentByseq",report_seq);//parent_seq찾기
				mybatis.update("Report.reportStateToDelete",report_seq);//report table 상태 '0'으로 변경
				rejectParent.add(parent_seq);
			}
		}
		
		for(String parent_seq:rejectParent) {
			mybatis.update("Report.boardStateToDelete",parent_seq);
		}
	}
	
	//신고리스트 전체 삭제
	public void deleteAllReport(Map<String, Object> param) {
		int board = 0;
		List<String> parent_seqs = mybatis.selectList("Report.reportParentSeqByCon",param);//조건에 따른 신고 리스트 뽑기
		int report = mybatis.update("Report.deleteAllReport",param);//리포트 테이블에서 전체 삭제
		for(String parent_seq:parent_seqs) {
			mybatis.update("Report.boardStateToDelete",parent_seq);
			board++;
		}
	}
	
	public int notDeletedReport(Map<String, Object> param) {
		return mybatis.selectOne("Report.notDeletedReportCount",param);
	}
	

	//해당 parent_seq 정보 지우기
	public void delete(String parent_seq) {
		mybatis.delete("Report.delete",parent_seq);
	}
	
	//리뷰의 부모 seq 찾기
	public String classSeqByReviewSeq(Object object){
		return mybatis.selectOne("Report.classSeqByReviewSeq",object);
	}
	//댓글 부모 seq 찾기
	public String boardSeqByReplySeq(String reply_seq){
		return mybatis.selectOne("Report.boardSeqByReplySeq",reply_seq);
	}

	//조건에 따른 블랙리스트 인원 뽑기
	public int totalBlackListCount(Map<String,Object> param) {
		return mybatis.selectOne("Report.totalBlackListCount",param);
	}
	
	//조건에 맞는 블랙리스트 멤버 정보 추출
	public List<Map<String,String>> selectBlackListByPage(Map<String,Object> param, int start, int end){
		param.put("start", start);
		param.put("end", end);
		return mybatis.selectList("Report.selectBlackListByPage",param);
	}
	
	public void cancelBlackList(String[] barr) {
		for(String email:barr) {
			mybatis.update("Report.cancelBlackList",email);
		}
	}
	
	//블랙리스트 등록
	public void regBlackList(String[] barr) {
		for(String email:barr) {
			mybatis.update("Report.regBlackList",email);
		}
	}
	
	//이메일로 블랙리스트 회원 정보 불러오기
	public Map<String,String> memberInfoByEmail(String email) {
		return mybatis.selectOne("Report.memberInfoByEmail", email);
	}
	
	//해당 멤버의 각 카테고리 별 신고 수 뽑기
	public List<Map<String,String>> reportCountByCategoty(String email) {
		return mybatis.selectList("Report.reportCountByCategoty", email);
	}
	
	//해당 멤버의 신고 리스트 뽑기
	public List<Map<String,String>> reportByEmail(String email,int start,int end){
		Map<String,Object> cond = new HashMap<>();
		cond.put("email", email);
		cond.put("start", start);
		cond.put("end", end);
		return mybatis.selectList("Report.reportByEmail", cond);
		}

	//이메일로 신고 삭제 처리
	public void deleteAllReportByEmail(String email) {
		
		List<String> parent_seqs = mybatis.selectList("Report.reportParentSeq",email);//삭제 대상의 parent_Seq 뽑기
		
		mybatis.update("Report.deleteAllReportByEmail",email);//reporttable에서 삭제 처리
		for(String parent_seq:parent_seqs) {//부모 테이블에서 삭제 처리
			mybatis.update("Report.boardStateToDelete",parent_seq);
		}

	}
	
	
	//report테이블에서 해당 게시글에 달린 댓글,대댓글의 신고 기록 삭제
	public void deleteReply(String board_seq) {
		mybatis.delete("Report.deleteReply", board_seq);
	}
	
	// 신고 테이블에서 삭제될 클래스 리뷰들의 신고 기록 삭제
	public void deleteRvByCSeq(String parent_seq) {
		mybatis.delete("Report.deleteRvByCSeq",parent_seq);
	}
}
