package kh.spring.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.spring.DAO.ClassDAO;
import kh.spring.DAO.ImgDAO;
import kh.spring.DAO.SeqDAO;
import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ImgDTO;

@Service
public class ClassService {
		
	@Autowired
	private ClassDAO cdao;
	
	@Autowired
	private ImgDAO idao;
	
	@Autowired
	private SeqDAO sdao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private Gson g;
	
	
	//게시글 + 이미지 업로드
	@Transactional
	public String insert(ClassDTO cdto,String arrImg) throws Exception{
		
		String class_seq = "c"+cdao.getNextSeq();
		
		//게시글 업로드
		cdto.setClass_seq(class_seq);
		cdao.insert(cdto);
		
		//파일 업로드				
		JsonArray arr = g.fromJson(arrImg, JsonArray.class);
		for(int i=0;i<arr.size();i++) {
			ImgDTO idto = g.fromJson(arr.get(i), ImgDTO.class);
			idto.setParent_seq(class_seq);
			
			String seq =sdao.getSeq(idto.getImg_seq());
			idto.setImg_seq(seq);
			idao.insert(idto);
		}
		
		// detailview 보여줄 seq 리턴
		return class_seq;
	}
	
	
	// 클래스 detailView에 들어갈 요소들 받아오기
	@Transactional
	public Map<String,String> selectDetailBySeq(String class_seq) throws Exception{
		
		Map<String,String> map = new HashMap<>();
		
		// class_seq에 해당하는 ClassDTO를 map에 담기
		ClassDTO cdto = cdao.selectBySeq(class_seq);
		
		// class_seq에 해당하는 ImgDTO List 를 map에 담기
		List<ImgDTO> arrImg = idao.selectByPSeq(class_seq);
		
		// 사용자가 해당 클래스를 찜했는지 여부를 map에 담기
		// String email = (String)session.getAttribute("loginID");		
		String email = "yjjung9494@hanmail.net";
		
		Map<String,String> map2 = new HashMap<>();		
		map2.put("email", email);
		map2.put("parent_seq", class_seq);
		
		Boolean likeOrNot=false;
		if(cdao.likeOrNot(map2)>0) {
			likeOrNot = true;
		}
		
		map.put("cdto", g.toJson(cdto));
		map.put("arrImg",g.toJson(arrImg));
		map.put("likeOrNot", g.toJson(likeOrNot));
		
		return map;		
	}
	
	
	// 클래스 찜 기능
	public int like(String email, String parent_seq) throws Exception{
		
		Map<String,String> map = new HashMap<>();		
		map.put("email", email);
		map.put("parent_seq", parent_seq);
		return cdao.like(map);
	}
	
	
	// 클래스 찜 취소
	public int likeCancel(String email, String parent_seq) throws Exception{
		
		Map<String,String> map = new HashMap<>();		
		map.put("email", email);
		map.put("parent_seq", parent_seq);
		return cdao.likeCancel(map);
	}
	
	
	// 클래스 등록 여부
	public int regOrNot(String std_id, String parent_seq) throws Exception{		

		Map<String,String> map = new HashMap<>();		
		map.put("std_id", std_id);
		map.put("parent_seq", parent_seq);
		return cdao.regOrNot(map);
	}
	
	
	// 클래스 구매 페이지에 들어갈 요소들
	@Transactional
	public Map<String,String> selectRegBySeq(String class_seq) throws Exception{
		
		Map<String,String> map = new HashMap<>();
		
		// class_seq에 해당하는 ClassDTO를 map에 담기
		ClassDTO cdto = cdao.selectBySeq(class_seq);
		
		// class_seq에 해당하는 ImgDTO List 를 map에 담기
		ImgDTO idto = idao.selectMByPSeq(class_seq);
		
		map.put("cdto", g.toJson(cdto));
		map.put("idto",g.toJson(idto));
		
		return map;		
	}
	
	
	// 클래스 구매 처리
	public int reg(String std_id, String type, String parent_seq) throws Exception{
		
		Map<String,String> map = new HashMap<>();
		map.put("std_id", std_id);
		map.put("type", type);
		map.put("parent_seq", parent_seq);
		
		return cdao.reg(map);
	}

}
