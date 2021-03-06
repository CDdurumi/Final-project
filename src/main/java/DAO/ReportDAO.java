package DAO;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.DTO.ReportDTO;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class ReportDAO {
	
	@Autowired
	private SqlSession mybatis;
	
	// AdminDAO
	// 신고 수 뽑기 
	public int countReportById(String id) {
		return mybatis.selectOne("Report.countReportById",id);
	}
	
	// 클래스 관련
	public int reportOrNot(Map<String,String> map) {
		return mybatis.selectOne("Report.reportOrNot",map);
	}
	
	public int report(ReportDTO rdto) {
		return mybatis.insert("Report.report",rdto);
	}
}
