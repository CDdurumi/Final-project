package kh.spring.Service;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DAO.MypageDAO;
import kh.spring.DTO.MemberDTO;

@Service
public class MypageService {
		
	@Autowired
	private MypageDAO dao;
	
	public MemberDTO select(String email) {
		return dao.select(email);
	}
	
	public int delete(String email) {
		return dao.delete(email);
	}
	
	public int updateInfo(MemberDTO dto) {
		return dao.updateInfo(dto);
	}
		
	public int updateImage(String email, String realPath, MultipartFile file) throws Exception{
		
		File realPathFile = new File(realPath); // 업로드 경로를 파일 객체로 생성하여
		if (!realPathFile.exists())
			realPathFile.mkdir(); // 경로가 존재하지 않는다면 생성

			String oriName = file.getOriginalFilename();
			String sysName = UUID.randomUUID() + "_" + oriName; // 중복되지 않는 임의의 값 + _ + 파일의 원래 이름
			file.transferTo(new File(realPath + "/" + sysName)); // 임시 저장소에 보관된 파일을 realPath 밑 sysName이라는 이름으로 전송 요청
			
			return dao.updateImage(email, sysName);
	}
	
	public int deleteImage(String email) {
		return dao.deleteImage(email);
	}
	
	public byte[] getFileContents(String realPath, String sys_name) throws Exception{
		File targetFile = new File(realPath+"/"+sys_name);
		try(DataInputStream dis = new DataInputStream(new FileInputStream(targetFile))){
			byte[] fileContents = new byte[(int)targetFile.length()];
			dis.readFully(fileContents);
			return fileContents;
		}
	}
}
