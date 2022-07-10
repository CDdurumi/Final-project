package kh.spring.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.spring.DTO.ReviewDTO;
import kh.spring.Service.ReviewService;

@Controller
@RequestMapping("/review/")
public class ReviewController {
	
	@Autowired
	private ReviewService rServ;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private Gson g;
	
	// 리뷰 작성시 저장
	@ResponseBody
	@RequestMapping(value="write",produces="text/html;charset=utf8") 
	public void write(String stars, String contents, String sys_name, String parent_seq) throws Exception{		
		
		String std_id=(String)session.getAttribute("loginID");
		rServ.insert(new ReviewDTO(null,std_id,Float.parseFloat(stars),contents,sys_name,null,0,0,parent_seq));
	}
	
	
	// 리뷰 작성 여부 확인
	@ResponseBody
	@RequestMapping(value="writeOrNot")
	public Boolean writeOrNot(String parent_seq) throws Exception{
		
		String std_id=(String)session.getAttribute("loginID");
		Boolean result = false;
		
		if(rServ.writeOrNot(std_id,parent_seq)>0) {
			result = true;
		};
		return result;
	}	
	
	
	// 리뷰 수정시 저장
	@ResponseBody
	@RequestMapping(value="modify",produces="text/html;charset=utf8") 
	public void modify(String review_seq, String stars, String contents, String sys_name,String parent_seq) throws Exception{		
		
		String std_id=(String)session.getAttribute("loginID");
		rServ.modify(new ReviewDTO(review_seq,std_id,Float.parseFloat(stars),contents,sys_name,null,0,0,parent_seq));
	}
	
	
	// 리뷰 삭제
	@ResponseBody
	@RequestMapping(value="delete",produces="text/html;charset=utf8") 
	public void delete(String review_seq, String parent_seq) throws Exception{		
		
		rServ.delete(review_seq, parent_seq);
	}
	
	
	//리뷰 좋아요
	@ResponseBody
	@RequestMapping(value="like",produces="text/html;charset=utf8") 
	public String like(String parent_seq) throws Exception{		
		
		String email=(String)session.getAttribute("loginID");
		return rServ.like(email, parent_seq);
	}
	
	
	//리뷰 좋아요
	@ResponseBody
	@RequestMapping(value="likeCancel",produces="text/html;charset=utf8") 
	public String likeCancel(String parent_seq) throws Exception{		
		
		String email=(String)session.getAttribute("loginID");
		return rServ.likeCancel(email, parent_seq);
	}
	
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
