package kh.spring.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImgDAO {
	@Autowired
	private SqlSession mybatis;
}
