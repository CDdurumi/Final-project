package kh.spring.Service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DAO.CommunityDAO;
import kh.spring.DAO.ImgDAO;
import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ImgDTO;

@Service
public class CommunityService {
	@Autowired
	private CommunityDAO dao;
	@Autowired
	private ImgDAO imgDao;
	
	//게시글 생성
	@Transactional
	public void insert(String categoryOption, CommunityDTO dto, MultipartFile[] file, String realPath) throws Exception {

		String seq = dao.insert(dto, categoryOption); //게시글 정보 board테이블에 삽입 및 seq가져오기	

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
			
			imgDao.insert(new ImgDTO(null, ori_name, sys_name, null, seq), "co");
		}
	}
}
