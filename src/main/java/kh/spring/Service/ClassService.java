package kh.spring.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import kh.spring.DAO.ClassDAO;
import kh.spring.DAO.FilesDAO;
import kh.spring.DAO.SeqDAO;
import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.FilesDTO;

@Service
public class ClassService {
		
	@Autowired
	private ClassDAO cdao;
	
	@Autowired
	private FilesDAO fdao;
	
	@Autowired
	private SeqDAO sdao;
	
	@Autowired
	private Gson g;
	
	@Transactional
	public String insert(ClassDTO cdto,String arrImg) throws Exception{
		
		String class_seq = "c"+cdao.getNextSeq();
		
		//게시글 업로드
		cdto.setClass_seq(class_seq);
		cdao.insert(cdto);
		
		//파일 업로드		
		
		JsonArray arr = g.fromJson(arrImg, JsonArray.class);
		for(int i=0;i<arr.size();i++) {
			FilesDTO fdto = g.fromJson(arr.get(i), FilesDTO.class);
			fdto.setParent_seq(class_seq);
			
			String seq =sdao.getSeq(fdto.getImg_seq());
			fdao.insert(fdto,seq);
		}
		
		// detailview 보여줄 seq 리턴
		return class_seq;
	}
	
	

}
