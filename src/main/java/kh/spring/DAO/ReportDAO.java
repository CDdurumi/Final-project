package kh.spring.DAO;

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
	
}
