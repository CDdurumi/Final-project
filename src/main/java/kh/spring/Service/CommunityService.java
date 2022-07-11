package kh.spring.Service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import DAO.ClassDAO;
import kh.spring.DAO.CommunityDAO;
import kh.spring.DAO.ImgDAO;
import kh.spring.DAO.SeqDAO;
import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.ReportDTO;

@Service
public class CommunityService {
	@Autowired
	private CommunityDAO dao;
	@Autowired
	private ImgDAO imgDao;
	@Autowired
	private SeqDAO seqDao;
	@Autowired
	private HttpSession session;

	
	//게시글 생성 및 수정
	@Transactional
	public void insert(String categoryOption, CommunityDTO dto, MultipartFile[] file, String DML) throws Exception {
		String realPath = session.getServletContext().getRealPath("community");	
		
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
			String sys_name = UUID.randomUUID() + "_" + ori_name;
			mf.transferTo(new File(realPath + "/" + sys_name));
			
			String imgSequence = seqDao.getSeq("co");//시퀀스 형식 가져와서 셋.(ex) 'co'||comImage_seq )
			
			ImgDTO imgDTO = new ImgDTO(imgSequence, ori_name, sys_name, null, seq);
			imgDao.insert(imgDTO);
		}
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
	
	// 기존 이미지 파일 삭제하기
	public void imgDel(String[] delFileList, String parent_seq) {
		String realPath = session.getServletContext().getRealPath("community");
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
		String realPath = session.getServletContext().getRealPath("community");
		List<ImgDTO> imgDto = imgDao.selectByPSeq(seq); //해당 게시글 이미지 sys_name 목록 가져와서 
		if(imgDto.size() != 0) {
			for(ImgDTO img : imgDto) {//서버에서 업로드 폴더에서 이미지 파일 지우기
				new File(realPath+"/"+img.getSys_name()).delete();
			}
		}
		
		imgDao.deleteByPSeq(seq);
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
	public int report(ReportDTO rdto) throws Exception{
		//해당 게시글,댓들,대댓글 state:1(신고) 로 변경
		String parent_seq = rdto.getParent_seq();
		if(parent_seq.substring(0, 1).equals("r")) {//댓글·대댓글 테이블
			dao.boardStateModi();
		}else {//커뮤니티 테이블
			dao.replyStateModi();///////////////////////나중에 
		}
		
		// 나중에 dao -> ReportDAO 사용할 것!!-----------------------------------------------------------
		dao.report(rdto);//신고관리 테이블에 신고 정보 삽입
	}
	
	
	
	
	
	
	//게시글 더미 데이터 만들기
	public void dumy(){
		dao.dumy();
	}
	
}
