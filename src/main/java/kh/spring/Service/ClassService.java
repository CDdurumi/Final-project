package kh.spring.Service;

import java.util.ArrayList;
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
	
	// 카테고리, 페이지 번호에 해당하는 리스트 출력
	@Transactional
	public Map<String,String> selectByCtgPage(String category, int page) throws Exception{
		
		int startNum = page*12-11;
		int endNum = page*12;		
		
		Map<String,String> param = new HashMap<>();
		param.put("category1", category);
		param.put("startNum", String.valueOf(startNum));
		param.put("endNum", String.valueOf(endNum));		
		
		// 카테고리 & 페이지에 해당하는 글 list
		List<ClassDTO> list = cdao.selectByCtgPage(param);
		
		// 해당 글들의 메인 이미지 list
		List<ImgDTO> mImgList = new ArrayList<>();
		for(ClassDTO cdto : list) {
			mImgList.add(idao.selectMByPSeq(cdto.getClass_seq()));
		}
		
		// 해당 카테고리의 총 페이지 수
		int categoryTotalCount = cdao.getCtgTotalCount(category);
		int recordCountPerPage = 12; 
		int lastPage = (int)Math.ceil(categoryTotalCount/(double)recordCountPerPage);
		
		// 글목록 & 메인 이미지 목록 & 총 페이지수를 json 형태로 리턴
		Map<String, String> map = new HashMap<>();
		map.put("list", g.toJson(list));
		map.put("mImgList", g.toJson(mImgList));
		map.put("lastPage", String.valueOf(lastPage));
		
		return map;
	}
	
	
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
		String email = (String)session.getAttribute("loginID");
		
		Boolean likeOrNot=false;
		
		if(email!=null) {
			Map<String,String> param = new HashMap<>();		
			param.put("email", email);
			param.put("parent_seq", class_seq);		
			
			if(cdao.likeOrNot(param)>0) {
				likeOrNot = true;
			}
		}
		
		// 클래스의 총 수강 인원
		int stdsNum = cdao.countStds(class_seq);
		
		// 클래스의 총 찜하기 수
		int likeNum = cdao.countLikes(class_seq);
		
		map.put("cdto", g.toJson(cdto));
		map.put("arrImg",g.toJson(arrImg));
		map.put("likeOrNot", g.toJson(likeOrNot));
		map.put("stdsNum", g.toJson(stdsNum));
		map.put("likeNum", g.toJson(likeNum));
		
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
