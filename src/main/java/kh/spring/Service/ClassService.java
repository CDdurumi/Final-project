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

import kh.spring.DAO.ClassDAO;
import kh.spring.DAO.GoodDAO;
import kh.spring.DAO.ImgDAO;
import kh.spring.DAO.RegStdsDAO;
import kh.spring.DAO.ReportDAO;
import kh.spring.DAO.ReviewDAO;
import kh.spring.DAO.SeqDAO;
import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.RegStdsDTO;
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
	private GoodDAO gdao;
	
	@Autowired
	private ReportDAO rpdao;
	
	@Autowired
	private RegStdsDAO rsdao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private Gson g;
	
	
	// index용 추천 클래스 6개 출력
	public List<Map<String,String>> selectIndex() throws Exception{
		
		List<Map<String,String>> list = cdao.selectIndex();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(Map<String,String> map : list) {			
			map.replace("CLASS_DATE", sdf.format(map.get("CLASS_DATE")));
		}
		
		return list; 
	}
	
	
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
		
		// 해당 글들의 메인 이미지 list & class_date 날짜 형식 timestamp -> date
		List<ImgDTO> mImgList = new ArrayList<>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(Map<String,String> map : list) {
			mImgList.add(idao.selectMByPSeq((String)map.get("CLASS_SEQ")));
			
			map.replace("CLASS_DATE", sdf.format(map.get("CLASS_DATE")));
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
			List<String> myLikeList = gdao.myLikeList(email);
			map.put("myLikeList", g.toJson(myLikeList));
		}
		
		return map;
	}
	
	
	// 검색 시 카테고리, 페이지 번호에 해당하는 리스트 출력
	@Transactional
	public Map<String,String> selectBySearch(String category, int page, String searchContents) throws Exception{
		
		int startNum = page*12-11;
		int endNum = page*12;		
		
		Map<String,String> param = new HashMap<>();
		param.put("category1", category);
		param.put("startNum", String.valueOf(startNum));
		param.put("endNum", String.valueOf(endNum));
		param.put("searchContents", searchContents);
		
		// 검색결과 & 카테고리 & 페이지에 해당하는 글 list
		List<Map<String,String>> list = cdao.selectBySearch(param);
		
		// 해당 글들의 메인 이미지 list & class_date 날짜 형식 timestamp -> date
		List<ImgDTO> mImgList = new ArrayList<>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(Map<String,String> map : list) {
			mImgList.add(idao.selectMByPSeq((String)map.get("CLASS_SEQ")));	
			
			map.replace("CLASS_DATE", sdf.format(map.get("CLASS_DATE")));
		}
		
		// 해당 카테고리의 총 검색 결과 페이지 수
		Map<String,String> param2 = new HashMap<>();
		param2.put("category1", category);
		param2.put("searchContents", searchContents);
		
		int categorySearchTotalCount = cdao.getCtgSearchTotalCount(param2);
		int recordCountPerPage = 12; 
		int lastPage = (int)Math.ceil(categorySearchTotalCount/(double)recordCountPerPage);
		
		// 글목록 & 메인 이미지 목록 & 총 페이지수를 json 형태로 리턴
		Map<String, String> map = new HashMap<>();
		map.put("list", g.toJson(list));
		map.put("mImgList", g.toJson(mImgList));
		map.put("lastPage", String.valueOf(lastPage));
		
		// 로그인 시 해당 아이디로 찜한 클래스의 목록을 추가
		String email = (String)session.getAttribute("loginID");
		if(email!=null) {
			List<String> myLikeList = gdao.myLikeList(email);
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
			if(gdao.goodExist(email,class_seq)>0) {
				likeOrNot = true;
			}
		}
		map.put("likeOrNot", g.toJson(likeOrNot));		
		
		// 클래스의 총 수강 인원
		int stdsNum = rsdao.countStds(class_seq);
		map.put("stdsNum", g.toJson(stdsNum));
		
		// 클래스의 총 찜하기 수
		int likeNum = gdao.countLikes(class_seq);
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
			//LocalDateTime ldt = LocalDateTime.of(2022, 7, 10, 19, 25, 00);
			
			String write_date="";			
			
			// 2일 이상 지난 글이라면
			if(now.toLocalDate().minusDays(1).isAfter(ldt.toLocalDate())) { 
				write_date=ldt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				
			// 일주일 이내 작성된 글이라면 (당일 x )
			}else if(now.toLocalDate().minusDays(1).isEqual(ldt.toLocalDate())) {
				write_date="어제";	
				
			// 당일 작성한지 1시간이 넘은 글	
			}else if(now.minusHours(1).isAfter(ldt)) {
				write_date=(Math.abs(now.getHour()-ldt.getHour()))+"시간 전";
				
			// 당일 작성한지 1시간이 안 된 글	
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
	public void like(String email, String parent_seq) throws Exception{
		
		// 클래스 테이블 likeCount + 1
		cdao.addLike(parent_seq);
		
		// 찜 테이블에 등록
		gdao.insert(email,parent_seq);
	}
	
	
	// 클래스 찜 취소
	public void likeCancel(String email, String parent_seq) throws Exception{
		
		// 클래스 테이블 likeCount - 1
		cdao.subLike(parent_seq);

		// 찜 테이블에서 삭제
		gdao.delete(email, parent_seq);
	}
	
	
	// 클래스 등록 여부
	public int regOrNot(String std_id, String parent_seq) throws Exception{		
		
		Map<String,String> param = new HashMap<>();		
		param.put("std_id", std_id);
		param.put("parent_seq", parent_seq);
		return rsdao.regOrNot(param);
	}
	
	
	// 클래스 구매 페이지에 들어갈 요소들
	@Transactional
	public Map<String,String> selectRegBySeq(String class_seq) throws Exception{
		
		Map<String,String> map = new HashMap<>();
		
		// class_seq에 해당하는 ClassDTO를 map에 담기
		ClassDTO cdto = cdao.selectBySeq(class_seq);
		
		// class_seq에 해당하는 ImgDTO List 를 map에 담기
		ImgDTO idto = idao.selectMByPSeq(class_seq);
		
		// 구매 seq 미리 받아오기
		int regStds_seq  = rsdao.getNewRegSeq();
		
		map.put("cdto", g.toJson(cdto));
		map.put("idto",g.toJson(idto));
		map.put("regStds_seq",g.toJson(regStds_seq));
		
		return map;		
	}
	
	
	// 클래스 구매 처리
	public int reg(int regStds_seq, String std_id, String type, String parent_seq,int price) throws Exception{
		
		Map<String,String> param = new HashMap<>();
		param.put("regStds_seq", String.valueOf(regStds_seq));
		param.put("std_id", std_id);
		param.put("type", type);
		param.put("parent_seq", parent_seq);
		param.put("price", String.valueOf(price));
		
		return rsdao.reg(param);
	}
	
	
	
	// 클래스 구매 취소 페이지에 들어갈 요소들
	@Transactional
	public Map<String,String> selectRefundBySeq(String class_seq) throws Exception{
		
		Map<String,String> map = new HashMap<>();
		
		// class_seq에 해당하는 ClassDTO를 map에 담기
		ClassDTO cdto = cdao.selectBySeq(class_seq);
		
		// class_seq에 해당하는 ImgDTO List 를 map에 담기
		ImgDTO idto = idao.selectMByPSeq(class_seq);
		
		// 취소 처리할 구매 내역 받아오기 (RegStdsDTO)
		String std_id = (String)session.getAttribute("loginID");
		Map<String,String> param = new HashMap<>();
		param.put("parent_seq", class_seq);
		param.put("std_id", std_id);
		RegStdsDTO rsdto  = rsdao.selectRefundBySeq(param);
		
		map.put("cdto", g.toJson(cdto));
		map.put("idto",g.toJson(idto));
		map.put("rsdto",g.toJson(rsdto));
		
		return map;		
	}
	
	
	
	// 클래스 취소 처리
	public int refund(int regStds_seq,int price) throws Exception{
		
		Map<String,Integer> param = new HashMap<>();
		param.put("regStds_seq", regStds_seq);
		param.put("price", price);
		return rsdao.refund(param);
	}
	
	
	
	// 신고 접수
	@Transactional
	public int report(ReportDTO rdto) throws Exception{
		
		// 리뷰 신고 건이라면
		if(rdto.getParent_seq().substring(1, 2).equals("r")) {
			rdao.setStateR(rdto.getParent_seq());
			
		// 클래스 신고 건이라면	
		}else {
			cdao.setStateR(rdto.getParent_seq());
		}	
		
		return rpdao.report(rdto);
	}
	
	
	// 클래스 삭제
	public int delete(String class_seq) throws Exception{
		
		// 클래스 이미지 삭제
		List<ImgDTO> imgList = idao.selectByPSeq(class_seq); 
		for(ImgDTO img : imgList) {
			this.deleteClassFile(img.getSys_name());
		}
		
		// 이미지 테이블에서 삭제
		idao.deleteByPSeq(class_seq);
		
		// 신고 테이블에서 삭제
		rpdao.delete(class_seq);;
		
		// 좋아요 테이블에서 삭제
		gdao.deleteByPSeq(class_seq);
		
		// 클래스 글 삭제
		return cdao.delete(class_seq);
	}

}
