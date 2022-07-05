package kh.spring.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.spring.DTO.ClassDTO;
import kh.spring.Service.ClassService;
import kh.spring.Service.ImgService;

@Controller
@RequestMapping("/class/")
public class ClassController {
	
	@Autowired
	private ClassService cServ;
	
	@Autowired
	private ImgService iServ;
	
	@Autowired
	private HttpSession sesstion;
	
	@Autowired
	private Gson g;
	
	// 목록으로 이동
	@RequestMapping("list") 
	public String list() {
		return "/class/classList";
	}
	
	// 클래스 등록 페이지로 이동
	@RequestMapping("write") 
	public String write() {
		return "/class/classWrite";
	}
	
	// 이미지 서버에 저장 (ajax)	
	@ResponseBody
	@RequestMapping(value="addFile",produces="text/html;charset=utf8")
	public String addFile(MultipartFile file) throws Exception{
		return iServ.addClassFile(file);
	}
	
	// 이미지 서버에서 삭제 (ajax)
	@ResponseBody
	@RequestMapping(value="deleteFile",produces="text/html;charset=utf8")
	public String deleteFile(String sys_name) throws Exception{
		return iServ.deleteClassFile(sys_name).toString();
	}
	
	// 글 업로드
	@ResponseBody
	@RequestMapping(value="upload",produces="text/html;charset=utf8")
	public String upload(ClassDTO cdto, String arrImg) throws Exception{
		// String writer = (String)session.getAttribute("loginID");
		String creater = "yjjung9494@hanmail.net";
		cdto.setCreater_id(creater);
		return cServ.insert(cdto,arrImg);		
	}
	
	
	@RequestMapping("detail")
	public String detail() {
		return "/class/classDetail";
	}
	
	@RequestMapping("reg")
	public String reg() {
		return "/class/classReg";
	}
	
	@RequestMapping("regFin")
	public String regFin() {
		return "/class/classRegF";
	}
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
