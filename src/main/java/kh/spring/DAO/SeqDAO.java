package kh.spring.DAO;

import org.springframework.stereotype.Repository;

@Repository
public class SeqDAO {
	
	public String getSeq(String category) {
		
		String seq = "";
		if(category.startsWith("ma")) {//클래스 메인 이미지
			seq = "'"+category+"'||mainimage_seq" ;
		}else if(category.startsWith("ex")){//클래스 설명 이미지
			seq = "'"+category+"'||eximage_seq"  ;
		}else if(category.equals("re")){//리뷰 이미지
			seq = "'re'||reimage_seq.nextval"  ;
		}else if(category.equals("co")){//커뮤니티 이미지
			seq = "'co'||comimage_seq.nextval"  ;
		}
		
		return seq;
	}
}
