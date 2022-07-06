package kh.spring.Service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DAO.ImgDAO;
import kh.spring.DTO.ImgDTO;

@Service
public class ImgService {
	@Autowired
	private ImgDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public String addClassFile(MultipartFile file) throws Exception{
		String realPath = session.getServletContext().getRealPath("upload"); // 파일 업로드 경로 설정
		File realPathFile = new File(realPath); 
		if(!realPathFile.exists()) {realPathFile.mkdir();} // 경로가 존재하지 않는다면 생성
		
		String ori_name = file.getOriginalFilename();
		String sys_name = UUID.randomUUID()+"_"+ori_name; 		
		file.transferTo(new File(realPath+"/"+sys_name)); 
		
		return "{\"ori_name\":\""+ori_name+"\",\"sys_name\":\""+sys_name+"\"}";
	}
	
	public Boolean deleteClassFile(String sys_name) {
		String realPath = session.getServletContext().getRealPath("upload");
		return new File(realPath+"/"+sys_name).delete();
	}
	

	// 커뮤니티 parentSeq 메인 이미지 1장 출력
	public ImgDTO selectCoProfileByPar(String parent_seq) {
		return dao.selectCoProfileByPar(parent_seq);
	}
	
	
	
}
