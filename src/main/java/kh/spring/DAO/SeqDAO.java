package kh.spring.DAO;

import org.springframework.stereotype.Repository;

@Repository
public class SeqDAO {
	
	//이미지 테이블 시퀀스 만들기 (ex) 'co'||comImage_seq )
	public String getSeq(String category) {
		
		String seq = "";
		if(category.startsWith("ma")) {//클래스 메인 이미지
			seq = "'"+category+"'||mainimage_seq" ;
		}else if(category.startsWith("ex")){//클래스 설명 이미지
			seq = "'"+category+"'||eximage_seq"  ;
		}else if(category.equals("re")){//리뷰 이미지
			seq = "'re'||reimage_seq"  ;
		}else if(category.equals("co")){//커뮤니티 이미지
			seq = "'co'||comimage_seq"  ;
		}
		
		return seq;
	}
	
	//커뮤니티 테이블 시퀀스 만들기 (ex) 'q'||question_seq"  )
	public String getCommunitySeq(String categoryOption) {
		String sequence = "";
		if(categoryOption.equals("q")) {//궁금해요
			sequence = "'"+categoryOption+"'||question_seq" ;
		}else if(categoryOption.equals("h")){//도와주세요
			sequence = "'"+categoryOption+"'||help_seq"  ;
		}else if(categoryOption.equals("s")){//도와드려요
			sequence = "'"+categoryOption+"'||support_seq"  ;
		}else if(categoryOption.equals("d")){//일상
			sequence = "'"+categoryOption+"'||daily_seq"  ;
		}
		
		return sequence;
	}
	
}
