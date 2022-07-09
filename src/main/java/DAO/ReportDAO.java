package DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

//import org.springframework.stereotype.Repository;
//
//@Repository
public class ReportDAO {
	
	// @Autowired
	private SqlSession mybatis;
	
	// AdminDAO
	// 신고 수 뽑기 
	public int countReportById(String id) {
		return mybatis.selectOne("Report.countReportById",id);
	}

}
