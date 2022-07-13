package kh.spring.DAO;

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
	
	//해당 parent_seq 정보 지우기
	public void delete(String parent_seq) {
		mybatis.delete("Report.delete",parent_seq);
	}
	
	
}
