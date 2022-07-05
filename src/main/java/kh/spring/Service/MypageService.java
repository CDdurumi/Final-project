package kh.spring.Service;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.DAO.Class1DAO;
import kh.spring.DAO.MypageDAO;
import kh.spring.DAO.Review1DAO;
import kh.spring.DTO.Class1DTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.Review1DTO;

@Service
public class MypageService {

	@Autowired
	private MypageDAO dao;

	@Autowired
	private Class1DAO cdao;
	
	@Autowired
	private Review1DAO rdao;

	public MemberDTO select(String email) {
		return dao.select(email);
	}

	// 연락처, 닉네임만 수정
	public int updateInfo(MemberDTO dto) {
		return dao.updateInfo(dto);
	}

	// 프로필 이미지 수정
	public int updateImage(String email, String realPath, MultipartFile file) throws Exception {

		File realPathFile = new File(realPath); // 업로드 경로를 파일 객체로 생성하여
		if (!realPathFile.exists())
			realPathFile.mkdir(); // 경로가 존재하지 않는다면 생성

		String oriName = file.getOriginalFilename();
		String sysName = UUID.randomUUID() + "_" + oriName; // 중복되지 않는 임의의 값 + _ + 파일의 원래 이름
		file.transferTo(new File(realPath + "/" + sysName)); // 임시 저장소에 보관된 파일을 realPath 밑 sysName이라는 이름으로 전송 요청

		return dao.updateImage(email, sysName);
	}

	// 프로필 이미지 삭제
	public int deleteImage(String email) {
		return dao.deleteImage(email);
	}

	// 회원 탈퇴
	public int delete(String email) {
		return dao.delete(email);
	}

	public byte[] getFileContents(String realPath, String sys_name) throws Exception {
		File targetFile = new File(realPath + "/" + sys_name);
		try (DataInputStream dis = new DataInputStream(new FileInputStream(targetFile))) {
			byte[] fileContents = new byte[(int) targetFile.length()];
			dis.readFully(fileContents);
			return fileContents;
		}
	}

	// 내가 구매한 클래스
	public List<Class1DTO> buyClass(String email) {
		return dao.buyClass(email);
	}

	// 클래스 구매일
	public List<String> buyClassDate(String email) {
		return dao.buyClassDate(email);
	}

	// 내가 등록한 클래스
	public List<Class1DTO> regClass(String email) {
		return dao.regClass(email);
	}

	// 내가 작성한 리뷰
	public List<Review1DTO> classReview(String email) {
		return dao.classReview(email);
	}

	// 내가 작성한 리뷰의 클래스 정보 보기
	public List<Class1DTO> reviewClass(String email) {
		return dao.reviewClass(email);
	}
}
