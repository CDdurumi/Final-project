package kh.spring.Controller;

import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.ImgDTO;
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
	private HttpSession session;
	
	@Autowired
	private Gson g;
	
	// 네비 및 재능마켓 헤더 클릭 시
		@RequestMapping("main") 
		public String main() {			
			return "redirect:/class/list?category=all&page=1";
		}
	
	// 목록으로 이동
	@RequestMapping("list") 
	public String list(String category, int page, Model model) throws Exception{
		
		Map<String,String> map = cServ.selectByCtgPage(category, page);
		
		//json을 List<ClassDTO>로 변환하여 model에 담기
		Type listType = new TypeToken<List<ClassDTO>>() {}.getType();
		
		List<ClassDTO> list = g.fromJson(map.get("list"), listType);
		model.addAttribute("list", list);
		
		//json을 List<ImgDTO>로 변환하여 model에 담기
		Type listType2 = new TypeToken<List<ImgDTO>>() {}.getType();
		List<ImgDTO> arrImg = g.fromJson(map.get("arrImg"), listType2);
		model.addAttribute("arrImg",arrImg);
		
		//해당 카테고리의 총 페이지 수를 model에 담기
		model.addAttribute("lastPage",map.get("lastPage"));
		
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
	
	
	// 클래스 글 업로드 (ajax)
	@ResponseBody
	@RequestMapping(value="upload",produces="text/html;charset=utf8")
	public String upload(ClassDTO cdto, String arrImg) throws Exception{
		
		String creater_id = (String)session.getAttribute("loginID");
		cdto.setCreater_id(creater_id);
		return cServ.insert(cdto,arrImg);		
	}
	
	
	// 클래스 글 읽기
	@RequestMapping("detail")
	public String detail(String class_seq,Model model) throws Exception{
		
		//ClassDTO 와 List<ImgDTO>,찜 여부를 json화 해서 받아옴
		Map<String, String> map = cServ.selectDetailBySeq(class_seq);
		
		//json을 classDTO로 변환하여 model에 담기
		model.addAttribute("cdto", g.fromJson(map.get("cdto"), ClassDTO.class));
		
		//ImgDTO를 담은 jsonArray model에 담기
		model.addAttribute("arrImg",map.get("arrImg"));
		
		//사용자의 해당 클래스 찜 여부를 model에 담기
		model.addAttribute("likeOrNot",map.get("likeOrNot"));
		
		//클래스의 총 수강 인원을 model에 담기
		model.addAttribute("stdsNum",map.get("stdsNum"));
		
		//클래스의 총 찜하기 수를 model에 담기
		model.addAttribute("likeNum",map.get("likeNum"));
		
		return "/class/classDetail";
	}
	 
	
	// 클래스 찜기능 (ajax)
	@RequestMapping("like")
	public void like(String parent_seq) throws Exception{		
		
		String email = (String)session.getAttribute("loginID");		
		cServ.like(email,parent_seq);
	}
	
	
	// 클래스 찜 취소 기능 (ajax)
	@RequestMapping("likeCancel")
	public void likeCancel(String parent_seq) throws Exception{	
		
		String email = (String)session.getAttribute("loginID");
		cServ.likeCancel(email,parent_seq);
	}
	
	
	// 클래스 구매 여부 (ajax)
	@ResponseBody
	@RequestMapping("regOrNot")
	public Boolean regOrNot(String parent_seq) throws Exception{
		
		String std_id = (String)session.getAttribute("loginID");
		Boolean regOrNot = false;
		if(cServ.regOrNot(std_id,parent_seq)>0) {
			regOrNot = true;
		}
		return regOrNot;		
	}

	
	// 클래스 구매 페이지로 이동
	@RequestMapping("toReg")
	public String reg(String class_seq,Model model) throws Exception{	
		
		//ClassDTO 와 메인 이미지 ImgDTO를 json화 해서 받아옴
		Map<String, String> map = cServ.selectRegBySeq(class_seq);
		
		//json을 classDTO로 변환하여 model에 담기
		model.addAttribute("cdto", g.fromJson(map.get("cdto"), ClassDTO.class));
		
		//json을 ImgDTO로 변환하여 model에 담기
		model.addAttribute("idto", g.fromJson(map.get("idto"), ImgDTO.class));
		
		return "/class/classReg";
	}
	
	
	// 클래스 구매 처리(ajax)
	@ResponseBody
	@RequestMapping("reg")
	public Boolean regOrNot(String parent_seq,String type) throws Exception{
		
		String std_id = (String)session.getAttribute("loginID");
		Boolean regFin = false;
		if(cServ.reg(std_id, type, parent_seq)>0) {
			regFin=true;
		}
		return regFin;
	}
	
	
	//결제 완료 페이지로 이동
	@RequestMapping("regFin")
	public String regFin(String class_seq,Model model) throws Exception{
		
		//ClassDTO 와 메인 이미지 ImgDTO를 json화 해서 받아옴
		Map<String, String> map = cServ.selectRegBySeq(class_seq);
		
		//json을 classDTO로 변환하여 model에 담기
		model.addAttribute("cdto", g.fromJson(map.get("cdto"), ClassDTO.class));
		
		//json을 ImgDTO로 변환하여 model에 담기
		model.addAttribute("idto", g.fromJson(map.get("idto"), ImgDTO.class));
				
		return "/class/classRegF";
	}
	
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
