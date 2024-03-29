package kh.spring.Service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DAO.CommunityDAO;
import kh.spring.DAO.GoodDAO;
import kh.spring.DAO.ImgDAO;
import kh.spring.DAO.ReplyDAO;
import kh.spring.DAO.ReportDAO;
import kh.spring.DAO.SeqDAO;
import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.ReplyDTO;
import kh.spring.DTO.ReportDTO;
import oracle.sql.TIMESTAMP;

@Service
public class CommunityService {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private CommunityDAO dao;
	@Autowired
	private ImgDAO imgDao;
	@Autowired
	private SeqDAO seqDao;
	@Autowired
	private ReplyDAO reDao;
	@Autowired
	private GoodDAO goDao;
	@Autowired
	private ReportDAO reportDao;
	
	//게시글 생성 및 수정
	@Transactional
	public String insert(String categoryOption, CommunityDTO dto, MultipartFile[] file, String DML) throws Exception {
//		String realPath = session.getServletContext().getRealPath("community");	
		String realPath = session.getServletContext().getRealPath("upload");	
		
		String seq = "";
		
		if(DML.equals("insert")) {//게시글 삽입
			String sequence = seqDao.getCommunitySeq(categoryOption);//시퀀스 형식 가져와서 셋.(ex) 'q'||question_seq"  )
			dto.setBoard_seq(sequence);
			seq = dao.insert(dto); //게시글 정보 board테이블에 삽입 및 seq가져오기	
		}else if(DML.equals("update")) {//게시글 수정
			seq = dto.getBoard_seq();
			dao.update(dto);//게시글 정보 수정
		}
		

		

		//파일 업로드/////////////
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) {
			realPathFile.mkdir();
		}
		
		for(MultipartFile mf : file) {
			String ori_name = mf.getOriginalFilename();			
			if(ori_name.equals("")) {
				break;
			}
			ori_name = ori_name.replace('[', '(').replace(']',')').replace('#',' ').replace(';',' ').replace('%',' ');
			String sys_name = UUID.randomUUID() + "_" + ori_name;
			mf.transferTo(new File(realPath + "/" + sys_name));
			
			String imgSequence = seqDao.getSeq("co");//시퀀스 형식 가져와서 셋.(ex) 'co'||comImage_seq )
			
			ImgDTO imgDTO = new ImgDTO(imgSequence, ori_name, sys_name, null, seq);
			imgDao.insert(imgDTO);
		}
		
		return seq;
	}
	
	//해당 페이지의 댓글 가져오기
	public List<CommunityDTO> selectByPage(int cpage, String category, String searchContent) {
		int start = (cpage-1) *10 +1;//해당 페이지의 첫 게시글 번호
		int end = cpage * 10;//해당 페이지의 끝 게시글 번호
		
		String isHash = "N";//해시태그 검색이냐?
		if(!searchContent.equals("") && searchContent !=null) {//검색 내용이 빈 문자가 아닐 때,
			if(searchContent.substring(0, 1).equals("#")) {//첫 글자가 #이냐
				isHash = "Y";
			}
		}

		return dao.selectByPage(start, end, category, searchContent, isHash);
		
	}
	
	//게시글 별 totalPage 가져오기
	public int totalPage(String category, String searchContent) {
		String isHash = "N";//해시태그 검색이냐?
		if(!searchContent.equals("") && searchContent !=null) {//검색 내용이 빈 문자가 아닐 때,
			if(searchContent.substring(0, 1).equals("#")) {//첫 글자가 #이냐
				isHash = "Y";
			}
		}
		
		return dao.totalPage(category, searchContent, isHash);
	}

	
	//게시글 정보 가져오기 by seq
	public CommunityDTO selectBySeq(String seq) {
		return dao.selectBySeq(seq);
	}
	
	
	// 커뮤니티 parentSeq 메인 이미지 1장 출력
	public ImgDTO selectCoProfileByPar(String parent_seq) {
		return imgDao.selectCoProfileByPar(parent_seq);
	}
	
	
	//게시글 조회 수 up
	public void viewCountUp(String seq) {
		dao.viewCountUp(seq);
	}
	

	//해당 멤버 정보 가져오기
	public MemberDTO selectById(String id) {
		//해당 게시글 작성자 알아오기
		return dao.selectById(id);
	}
	
	
	// parentSeq로 해당 게시글 이미지 목록 가져오기
	public List<ImgDTO> selectByPSeq(String parent_seq) {
		return imgDao.selectByPSeq(parent_seq);
	}
	
	// 기존 이미지 파일 삭제하기(게시글 수정 시)
	public void imgDel(String[] delFileList, String parent_seq) {
//		String realPath = session.getServletContext().getRealPath("community");
		String realPath = session.getServletContext().getRealPath("upload");
		if(delFileList != null) {
			for(String sys_name : delFileList) {//서버에서 이미지 파일 지우기
				new File(realPath+"/"+sys_name).delete();
			}
		}

		imgDao.delBySysname(delFileList, parent_seq);//디비에서 이미지 파일 삭제하기
	}
	
	
	//게시글 삭제하기
	@Transactional
	public void delete(String seq) {
//		String realPath = session.getServletContext().getRealPath("community");
		String realPath = session.getServletContext().getRealPath("upload");
		List<ImgDTO> imgDto = imgDao.selectByPSeq(seq); //해당 게시글 이미지 sys_name 목록 가져와서 
		if(imgDto.size() != 0) {
			for(ImgDTO img : imgDto) {//서버에서 업로드 폴더에서 이미지 파일 지우기
				new File(realPath+"/"+img.getSys_name()).delete();
			}
		}
		
		imgDao.deleteByPSeq(seq);//이미지 목록 삭제하기
		reportDao.deleteReply(seq);//report테이블에서 해당 게시글에 달린 댓글,대댓글의 신고 기록 삭제
		reportDao.delete(seq);//신고 테이블에서 해당 시퀀스 정보 삭제
		goDao.deleteReply(seq);//good테이블에서 해당 게시글에 달린 댓글,대댓글의 좋아요 기록 삭제
		goDao.deleteByPSeq(seq);//good테이블에서 로그인id 해당 게시글에 좋아요 한 정보 삭제
		dao.delete(seq);//게시글 삭제하기
	}
	
	
	//도와주세요 진행여부(마감) 변경
	public void progressUpdate(String seq ,String progress ) {
		if(progress.equals("Y")) {//진행중이었으면,
			progress = "N";//마감으로 바꾸겠다
		}else {
			progress = "Y";
		}
		dao.progressUpdate(seq, progress);
	}
	

	// 신고 접수
	@Transactional
	public void report(ReportDTO rdto) throws Exception{
		//해당 게시글,댓들,대댓글 state:1(신고) 로 변경
		String seq = rdto.getParent_seq();
		String state = "1";//신고
		if(seq.substring(0, 1).equals("r")) {//댓글·대댓글 테이블에 대한 것이면,
			reDao.replyStateModi(seq,state);
		}else {//커뮤니티 테이블
			dao.boardStateModi(seq,state);
		}
		
		// 나중에 dao -> ReportDAO 사용할 것!!-----------------------------------------------------------
		reportDao.report(rdto);//신고관리 테이블에 신고 정보 삽입
	}
	
	
	//게시글,댓글, 대댓글 좋아요 Up&Dwon
	@Transactional
	public int boardLike(String likeUpDown, String seq) {
		//좋아요 정보 삽입 및 삭제
		String email = (String)session.getAttribute("loginID");
		if(likeUpDown.equals("1")) {//삽입
			goDao.insert(email,seq);
		}else {//삭제
			goDao.delete(email,seq);
		}

		
		//좋아요 Up&Dwon
		if(seq.substring(0, 1).equals("r")) {//댓글·대댓글 테이블에 대한 것이면,
			return reDao.replyLike(likeUpDown, seq);
		}else {//커뮤니티 테이블
			return dao.boardLike(likeUpDown, seq);
		}
		
		
	}
	
	
	//해당 게시글 좋아요 여부 판단
	public int boardGoodExist(String parent_seq) {
		if((String)session.getAttribute("loginID") != null) {
			String email = (String)session.getAttribute("loginID");
			return goDao.goodExist(email, parent_seq);
		}else {
			return 0;
		}

	}
	
	
	//댓글, 대댓글 등록
	@Transactional
	public List<Map<String, Object>> replyReg(ReplyDTO dto) throws Exception {
		dto.setWriter( (String)session.getAttribute("loginID") );
		if(dto.getParent_seq().substring(0,1).equals("r")) {//대댓글
			dto.setReply_seq(seqDao.getReplySeq("rr"));
		}else {//댓글 - why?parent_seq 앞자리가 커뮤니티 게시글(q,h,s,d)
			dto.setReply_seq(seqDao.getReplySeq("r"));
		}

		String seq = reDao.replyReg(dto);//댓글,대댓글 삽입
		
		//시간 형식 변환해서 대체시키기
		List<Map<String, Object>> list = reDao.getReply(seq);
		// 리뷰리스트 시간 표시 ( n분 전, n시간 전, n일 전, yyyy-MM-dd ) 
		LocalDateTime now = LocalDateTime.now();
		for(Map<String,Object> m : list) {
			
			TIMESTAMP tstp = (TIMESTAMP)m.get("WRITE_DATE");
			LocalDateTime ldt = tstp.toLocalDateTime();
			//LocalDateTime ldt = LocalDateTime.of(2022, 7, 10, 19, 25, 00);
			
			String WRITE_DATE="";
			
			
			// 2일 이상 지난 글이라면
			if(now.toLocalDate().minusDays(1).isAfter(ldt.toLocalDate())) { 
				WRITE_DATE=ldt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				
			// 일주일 이내 작성된 글이라면 (당일 x )
			}else if(now.toLocalDate().minusDays(1).isEqual(ldt.toLocalDate())) {
				WRITE_DATE="어제";	
				
			// 당일 작성한지 1시간이 넘은 글	
			}else if(now.minusHours(1).isAfter(ldt)) {
				WRITE_DATE=(Math.abs(now.getHour()-ldt.getHour()))+"시간 전";
				
			// 당일 작성한지 1시간이 안 된 글	
			}else if(now.minusMinutes(1).isAfter(ldt)){
				WRITE_DATE=(Math.abs(now.getMinute()-ldt.getMinute()))+"분 전";
				
			}else {
				WRITE_DATE="방금 전";
			}
			m.replace("WRITE_DATE", WRITE_DATE);
		}
		

		return list;
	}
	
	
	
	//해당 게시글 댓글 리스트
	public List<Map<String, Object>> replyList(String board_seq) throws Exception {
		
		List<Map<String, Object>> list = reDao.replyList(board_seq);
		
		//시간 형식 변환해서 대체시키기
		LocalDateTime now = LocalDateTime.now();
		for(Map<String,Object> m : list) {
			
			TIMESTAMP tstp = (TIMESTAMP)m.get("WRITE_DATE");
			LocalDateTime ldt = tstp.toLocalDateTime();
			//LocalDateTime ldt = LocalDateTime.of(2022, 7, 10, 19, 25, 00);
			
			String WRITE_DATE="";
			
			
			// 2일 이상 지난 글이라면
			if(now.toLocalDate().minusDays(1).isAfter(ldt.toLocalDate())) { 
				WRITE_DATE=ldt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				
			// 일주일 이내 작성된 글이라면 (당일 x )
			}else if(now.toLocalDate().minusDays(1).isEqual(ldt.toLocalDate())) {
				WRITE_DATE="어제";	
				
			// 당일 작성한지 1시간이 넘은 글	
			}else if(now.minusHours(1).isAfter(ldt)) {
				WRITE_DATE=(Math.abs(now.getHour()-ldt.getHour()))+"시간 전";
				
			// 당일 작성한지 1시간이 안 된 글	
			}else if(now.minusMinutes(1).isAfter(ldt)){
				WRITE_DATE=(Math.abs(now.getMinute()-ldt.getMinute()))+"분 전";
				
			}else {
				WRITE_DATE="방금 전";
			}
			m.replace("WRITE_DATE", WRITE_DATE);
		}
		

		return list;
		
	}
	


	//해당 게시글 대댓글 리스트
	public List<Map<String, Object>> replyReList(String board_seq) throws Exception {
		
		List<Map<String, Object>> list = reDao.replyReList(board_seq);
		
		//시간 형식 변환해서 대체시키기
		LocalDateTime now = LocalDateTime.now();
		for(Map<String,Object> m : list) {
			
			TIMESTAMP tstp = (TIMESTAMP)m.get("WRITE_DATE");
			LocalDateTime ldt = tstp.toLocalDateTime();
			//LocalDateTime ldt = LocalDateTime.of(2022, 7, 10, 19, 25, 00);
			
			String WRITE_DATE="";
			
			
			// 2일 이상 지난 글이라면
			if(now.toLocalDate().minusDays(1).isAfter(ldt.toLocalDate())) { 
				WRITE_DATE=ldt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				
			// 일주일 이내 작성된 글이라면 (당일 x )
			}else if(now.toLocalDate().minusDays(1).isEqual(ldt.toLocalDate())) {
				WRITE_DATE="어제";	
				
			// 당일 작성한지 1시간이 넘은 글	
			}else if(now.minusHours(1).isAfter(ldt)) {
				WRITE_DATE=(Math.abs(now.getHour()-ldt.getHour()))+"시간 전";
				
			// 당일 작성한지 1시간이 안 된 글	
			}else if(now.minusMinutes(1).isAfter(ldt)){
				WRITE_DATE=(Math.abs(now.getMinute()-ldt.getMinute()))+"분 전";
				
			}else {
				WRITE_DATE="방금 전";
			}
			m.replace("WRITE_DATE", WRITE_DATE);
		}
		

		return list;
		
	}	
	
	
	//해당 게시글에서 좋아요 한 댓글 정보
	public List<Map<String,String>> replyGoodList(String board_seq){
		String email = (String)session.getAttribute("loginID");
		return reDao.replyGoodList(board_seq, email);
	}
	
	//해당 게시글에서 좋아요 한 대댓글 정보
	public List<Map<String,String>> replyReGoodList(String board_seq){
		String email = (String)session.getAttribute("loginID");
		return reDao.replyReGoodList(board_seq, email);
	}
	
	
	
	//댓글,대댓글 삭제
	@Transactional
	public int replyDel(String seq) {
		String email = (String)session.getAttribute("loginID");
		
		if(seq.substring(0,2).equals("rr")) {//대댓글
			goDao.delete(email,seq);//good 테이블에서 로그인id 해당 대댓글 좋아요 한 정보 삭제
			reportDao.delete(seq);//신고 테이블에서 해당 시퀀스 정보 삭제
			return reDao.replyDel(seq);//대댓글 삭제
		}else {//댓글
			goDao.deleteRR(seq);//대댓글 좋아요 한 정보 삭제
			goDao.delete(email,seq);//good 테이블에서 로그인id 해당 댓글 좋아요 한 정보 삭제
			reportDao.deleteRR(seq);//대댓글 신고 한 정보 삭제
			reportDao.delete(seq);//신고 테이블에서 해당 시퀀스 정보 삭제
			
			reDao.replyReDel(seq);//해당 댓글에 달린 대댓글 삭제
			return reDao.replyDel(seq);//댓글 삭제
		}		
		
	}
	
	
	//댓글, 대댓글 수정
	public void replyModi(String seq, String contents) {
		reDao.replyModi(seq, contents);//댓글, 대대글 수정
	}
	
	
	
	//게시글 댓글 개수 가져오기
	public int reCount(String parent_seq) {
		return reDao.reCount(parent_seq);
	}
	
	
	
	// 커뮤니티 카테고리 별 최신순(궁금해요, 도와주세요, 도와드려요, 일상 각 1개씩 총 4개)
	public List<Map<String, Object>> selectIndex() throws Exception {
	
		List<Map<String, Object>> list = dao.selectIndex();
		//시간 형식 변환해서 대체시키기
		LocalDateTime now = LocalDateTime.now();
		for(Map<String,Object> m : list) {
			
			TIMESTAMP tstp = (TIMESTAMP)m.get("WRITE_DATE");
			LocalDateTime ldt = tstp.toLocalDateTime();
			//LocalDateTime ldt = LocalDateTime.of(2022, 7, 10, 19, 25, 00);
			
			String WRITE_DATE="";
			
			
			// 2일 이상 지난 글이라면
			if(now.toLocalDate().minusDays(1).isAfter(ldt.toLocalDate())) { 
				WRITE_DATE=ldt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				
			// 일주일 이내 작성된 글이라면 (당일 x )
			}else if(now.toLocalDate().minusDays(1).isEqual(ldt.toLocalDate())) {
				WRITE_DATE="어제";	
				
			// 당일 작성한지 1시간이 넘은 글	
			}else if(now.minusHours(1).isAfter(ldt)) {
				WRITE_DATE=(Math.abs(now.getHour()-ldt.getHour()))+"시간 전";
				
			// 당일 작성한지 1시간이 안 된 글	
			}else if(now.minusMinutes(1).isAfter(ldt)){
				WRITE_DATE=(Math.abs(now.getMinute()-ldt.getMinute()))+"분 전";
				
			}else {
				WRITE_DATE="방금 전";
			}
			m.replace("WRITE_DATE", WRITE_DATE);
		}		
		
		
		return list;
	}
	
	
	
	
	
	
	//게시글 더미 데이터 만들기
	public void dumy(){
		dao.dumy();
	}
	
}
