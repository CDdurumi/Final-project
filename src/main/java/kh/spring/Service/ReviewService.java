package kh.spring.Service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import kh.spring.DAO.ClassDAO;
import kh.spring.DAO.GoodDAO;
import kh.spring.DAO.ReportDAO;
import kh.spring.DAO.ReviewDAO;
import kh.spring.DTO.ReviewDTO;

@Service
public class ReviewService {
	
	@Autowired
	private ClassService cServ;
	
	@Autowired
	private ReviewDAO rdao;
	
	@Autowired
	private ClassDAO cdao;
	
	@Autowired
	private GoodDAO gdao;
	
	@Autowired
	private ReportDAO rpdao;

	@Autowired
	private HttpSession session;
	
	@Autowired
	private Gson g;
	
	// 작성한 리뷰 저장
	@Transactional
	public int insert(ReviewDTO rdto) throws Exception{
		
		// 리뷰 테이블에 저장
		 rdao.insert(rdto);
		
		// 새 별점 계산
		 Map<String,Object> map = rdao.checkStars(rdto.getParent_seq());	 
		 
		 BigDecimal bReviews = (BigDecimal)map.get("REVIEWS");
		 BigDecimal bStars = (BigDecimal)map.get("STARS");
		 
		 int reviews = bReviews.intValue();
		 Float stars = bStars.floatValue();
		 stars = stars/reviews;
		 
		 Map<String,Object> param = new HashMap<>();
		 param.put("class_seq", rdto.getParent_seq());
		 param.put("star_count", stars);
		 
		 return cdao.newStars(param);
	}
	
	// 리뷰 작성 여부 확인
	public int writeOrNot(String std_id, String parent_seq) throws Exception{
		Map<String, String> param = new HashMap<>();
		param.put("std_id", std_id);
		param.put("parent_seq", parent_seq);
		return rdao.writeOrNot(param);
	}
	
	
	// 수정한 리뷰 저장
	@Transactional
	public int modify(ReviewDTO rdto) throws Exception{		
		
		// 리뷰 테이블에 저장
		 rdao.modify(rdto);
		 
		// 새 별점 계산
		 Map<String,Object> map = rdao.checkStars(rdto.getParent_seq());	 
		 
		 BigDecimal bReviews = (BigDecimal)map.get("REVIEWS");
		 BigDecimal bStars = (BigDecimal)map.get("STARS");
		 
		 int reviews = bReviews.intValue();
		 Float stars = bStars.floatValue();	
		 stars = stars/reviews;
		 
		 Map<String,Object> param = new HashMap<>();
		 param.put("class_seq", rdto.getParent_seq());
		 param.put("star_count", stars);
		 
		 return cdao.newStars(param);
	}
	
	
	// 리뷰 삭제
	@Transactional
	public int delete(String review_seq, String parent_seq) throws Exception{		
		
		// 리뷰 이미지 삭제		
		String sys_name = rdao.getSysname(review_seq);
		if(sys_name!=null) {
			cServ.deleteClassFile(sys_name);
		} 
		
		// 신고 테이블에서 삭제
		 rpdao.delete(review_seq);;
		
		// 리뷰 테이블에서 삭제
		 rdao.delete(review_seq);
		 
		 
		// 새 별점 계산
		 Map<String,Object> map = rdao.checkStars(parent_seq);	 
		 
		 Float stars=Float.valueOf(0);
		 BigDecimal bReviews = (BigDecimal)map.get("REVIEWS");
		 int reviews = bReviews.intValue();
		 
		 if(reviews!=0) {
			 
			 BigDecimal bStars = (BigDecimal)map.get("STARS");			 
			 
			 stars = bStars.floatValue();	
			 stars = stars/reviews;
		 }
		 
		 Map<String,Object> param = new HashMap<>();
		 param.put("class_seq", parent_seq);
		 param.put("star_count", stars);
		 
		 return cdao.newStars(param);
	}
	
	
	// 리뷰 좋아요
	@Transactional
	public String like(String email,String parent_seq)throws Exception{
		
		// 찜 테이블에 등록
		gdao.insert(email,parent_seq);
		
		// 리뷰 테이블 likeCount + 1
		rdao.addLike(parent_seq);
		
		// 현재 총 좋아요 수
		
		return String.valueOf(rdao.getLikeCount(parent_seq));
	}
	
	
	// 리뷰 좋아요 취소
	@Transactional
	public String likeCancel(String email,String parent_seq)throws Exception{
		
		// 찜 테이블에 등록
		gdao.delete(email,parent_seq);
		
		// 리뷰 테이블 likeCount + 1
		rdao.subLike(parent_seq);
		
		// 현재 총 좋아요 수
		
		return String.valueOf(rdao.getLikeCount(parent_seq));
	}
	
}
