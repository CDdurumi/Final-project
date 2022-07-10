package kh.spring.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import DAO.GoodDAO;
import kh.spring.DAO.ClassDAO;
import kh.spring.DAO.ImgDAO;
import kh.spring.DAO.ReviewDAO;
import kh.spring.DAO.SeqDAO;
import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.ReportDTO;
import oracle.sql.TIMESTAMP;

@Service
public class ClassService {
		
	@Autowired
	private ClassDAO cdao;
	
	@Autowired
	private ImgDAO idao;
	
	@Autowired
	private SeqDAO sdao;
	
	@Autowired
	private ReviewDAO rdao;
	
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
		List<Map<String,String>> list = cdao.selectByCtgPageNN(param);
		//List<ClassDTO> list = cdao.selectByCtgPage(param);
		
		// 해당 글들의 메인 이미지 list
		List<ImgDTO> mImgList = new ArrayList<>();
		for(Map<String,String> map : list) {
			mImgList.add(idao.selectMByPSeq((String)map.get("CLASS_SEQ")));
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
		
		// 로그인 시 해당 아이디로 찜한 클래스의 목록을 추가
		// cdao ->  GoodDAO 으로 이동
		String email = (String)session.getAttribute("loginID");
		if(email!=null) {
			List<String> myLikeList = cdao.myLikeList(email);
			map.put("myLikeList", g.toJson(myLikeList));
		}
		
		return map;
	}
	
	
	// 이미지 파일 저장
	public String addClassFile(MultipartFile file) throws Exception{
		String realPath = session.getServletContext().getRealPath("upload"); // 파일 업로드 경로 설정
		File realPathFile = new File(realPath); 
		if(!realPathFile.exists()) {realPathFile.mkdir();} // 경로가 존재하지 않는다면 생성
		
		String ori_name = file.getOriginalFilename();
		String sys_name = UUID.randomUUID()+"_"+ori_name; 		
		file.transferTo(new File(realPath+"/"+sys_name)); 
		
		return "{\"ori_name\":\""+ori_name+"\",\"sys_name\":\""+sys_name+"\"}";
	}
	
	
	// 이미지 파일 삭제
	public Boolean deleteClassFile(String sys_name) {
		String realPath = session.getServletContext().getRealPath("upload");
		return new File(realPath+"/"+sys_name).delete();
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
		// ClassDTO cdto = cdao.selectBySeq(class_seq);
		Map<String,String> cdtoNN = cdao.selectBySeqNN(class_seq);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		cdtoNN.replace("CLASS_DATE", sdf.format(cdtoNN.get("CLASS_DATE")));
		map.put("cdtoNN", g.toJson(cdtoNN));
		
		// class_seq에 해당하는 ImgDTO List 를 map에 담기
		List<ImgDTO> arrImg = idao.selectByPSeq(class_seq);
		map.put("arrImg",g.toJson(arrImg));
		
		// 사용자가 해당 클래스를 찜했는지 여부를 map에 담기
		String email = (String)session.getAttribute("loginID");
		Boolean likeOrNot=false;
		
		if(email!=null) {
			Map<String,String> param = new HashMap<>();		
			param.put("email", email);
			param.put("parent_seq", class_seq);		
			
			// cdao ->  GoodDAO 으로 이동
			if(cdao.likeOrNot(param)>0) {
				likeOrNot = true;
			}
		}
		map.put("likeOrNot", g.toJson(likeOrNot));		
		
		// cdao -> RegStdsDAO 로 이동
		// 클래스의 총 수강 인원
		int stdsNum = cdao.countStds(class_seq);
		map.put("stdsNum", g.toJson(stdsNum));
		
		// cdao -> GoodDAO 로 이동
		// 클래스의 총 찜하기 수
		int likeNum = cdao.countLikes(class_seq);
		map.put("likeNum", g.toJson(likeNum));
		
		// 리뷰 리스트 (비회원, 회원 구분)
		List<Map<String,Object>> rlist = rdao.selectByPSeq(class_seq);
		if(email!=null) {
			Map<String,String> param = new HashMap<>();		
			param.put("std_id", email);
			param.put("parent_seq", class_seq);	
			rlist = rdao.selectByPSeqId(param);
		}
		
			// 리뷰리스트 시간 표시 ( n분 전, n시간 전, n일 전, yyyy-MM-dd ) 
			//				& 좋아요 수
		LocalDateTime now = LocalDateTime.now();
		
		for(Map<String,Object> m : rlist) {
			
			TIMESTAMP tstp = (TIMESTAMP)m.get("WRITE_DATE");
			LocalDateTime ldt = tstp.toLocalDateTime();		
			
			String write_date="";
			
			// 7일 이상 지난 글이라면
			if(now.minusDays(7).isAfter(ldt)) { 
				write_date=ldt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			
			// 일주일 이내 작성된 글이라면 (당일 x )
			}else if(now.minusDays(1).isAfter(ldt)) {
				write_date=(Math.abs(now.getDayOfMonth()-ldt.getDayOfMonth()))+"일 전";
			
			// 당일 작성한지 1시간이 넘은 글	
			}else if(now.minusHours(1).isAfter(ldt)) {
				write_date=(Math.abs(now.getHour()-ldt.getHour()))+"시간 전";
			
			}else if(now.minusMinutes(1).isAfter(ldt)){
				write_date=(Math.abs(now.getMinute()-ldt.getMinute()))+"분 전";
				
			}else {
				write_date="방금 전";
			}
			m.replace("WRITE_DATE", write_date);
		}
		
		map.put("rlist", g.toJson(rlist));
		
		return map;		
	}
	
	
	// 클래스 찜 기능
	@Transactional
	public int like(String email, String parent_seq) throws Exception{
		
		// 클래스 테이블 likeCount + 1
		cdao.addLike(parent_seq);
		
		// cdao -> GoodDAO 으로 이동
		// 찜 테이블에 등록
		Map<String,String> param = new HashMap<>();		
		param.put("email", email);
		param.put("parent_seq", parent_seq);
		return cdao.like(param);
	}
	
	
	// 클래스 찜 취소
	public int likeCancel(String email, String parent_seq) throws Exception{
		
		// 클래스 테이블 likeCount - 1
		cdao.subLike(parent_seq);
		
		// cdao -> GoodDAO 으로 이동
		// 찜 테이블에서 삭제
		Map<String,String> param = new HashMap<>();		
		param.put("email", email);
		param.put("parent_seq", parent_seq);
		return cdao.likeCancel(param);
	}
	
	
	// 클래스 등록 여부
	public int regOrNot(String std_id, String parent_seq) throws Exception{		
		
		// cdao -> RegStdsDAO 로 이동
		Map<String,String> param = new HashMap<>();		
		param.put("std_id", std_id);
		param.put("parent_seq", parent_seq);
		return cdao.regOrNot(param);
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
		
		// cdao -> RegStdsDAO 로 이동
		Map<String,String> param = new HashMap<>();
		param.put("std_id", std_id);
		param.put("type", type);
		param.put("parent_seq", parent_seq);
		
		return cdao.reg(param);
	}
	
	
	// 신고 여부 확인
	public int reportOrNot(String reporter, String parent_seq) throws Exception{
		
		// cdao -> ReportDAO 로 이동
		Map<String,String> param = new HashMap<>();
		param.put("reporter", reporter);
		param.put("parent_seq", parent_seq);
		
		return cdao.reportOrNot(param);
	}
	
	
	// 신고 접수
	public int report(ReportDTO rdto) throws Exception{
		// cdao -> ReportDAO 로 이동
		return cdao.report(rdto);
	}

}
