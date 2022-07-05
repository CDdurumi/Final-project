package kh.spring.DAO;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ImgDTO;

@Repository
public class ImgDAO {
	@Autowired
	private SqlSession mybatis;
	
	//삽입
	public int insert(ImgDTO dto , String category) {
		Map<String, String> map = new HashMap<>();
		
		String sequence = "";
		if(category.equals("ma")) {//클래스 메인 이미지
			sequence = "'ma'||mainimgge_seq" ;
		}else if(category.equals("ex")){//클래스 설명 이미지
			sequence = "'ex'||eximgge_seq"  ;
		}else if(category.equals("re")){//리뷰 이미지
			sequence = "'re'||reimgge_seq"  ;
		}else if(category.equals("co")){//커뮤니티 이미지
			sequence = "'co'||comimgge_seq"  ;
		}
		
		map.put("img_seq", sequence);
		map.put("ori_name", dto.getOri_name());
		map.put("sys_name", dto.getSys_name());
		map.put("img_desc", dto.getimg_desc());//xml에서 if test로 null 처리
		map.put("parent_seq", dto.getParent_seq());
		
		return mybatis.insert("Img.insert",dto);
	}
}
