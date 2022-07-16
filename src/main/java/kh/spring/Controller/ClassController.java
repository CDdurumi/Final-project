package kh.spring.Controller;

import java.lang.reflect.Type;
import java.net.URLEncoder;
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
import kh.spring.DTO.RegStdsDTO;
import kh.spring.DTO.ReportDTO;
import kh.spring.Service.ClassService;

@Controller
@RequestMapping("/class/")
public class ClassController {
	
	@Autowired
	private ClassService cServ;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private Gson g;
	
	
	
	// 네비 및 재능마켓 헤더 클릭 시
	@RequestMapping(value="main",produces="text/html;charset=utf8") 
	public String main() throws Exception{			
		String all = URLEncoder.encode("전체", "UTF-8");
		return "redirect:/class/list?category="+all+"&page=1";
	}
	
	
	
	// 목록으로 이동
	@RequestMapping("list") 
	public String list(String category, int page, Model model) throws Exception{
		
		Map<String,String> map = cServ.selectByCtgPage(category, page);

		//json을 List<Map<String,String>>로 변환하여 model에 담기
		Type listType = new TypeToken<List<Map<String,String>>>() {}.getType();		
		List<Map<String,String>> list = g.fromJson(map.get("list"), listType);	
		
		model.addAttribute("list", list);
		
		//json을 List<ImgDTO>로 변환하여 model에 담기
		Type listType2 = new TypeToken<List<ImgDTO>>() {}.getType();
		List<ImgDTO> mImgList = g.fromJson(map.get("mImgList"), listType2);
		model.addAttribute("mImgList",mImgList);
		
		//현재 페이지 위치를 model에 담기
		model.addAttribute("currPage",page);
		
		//해당 카테고리의 총 페이지 수를 model에 담기
		model.addAttribute("lastPage",map.get("lastPage"));
		
		//로그인시 해당 아이디로 찜한 클래스 목록을 model에 담기
		if((String)session.getAttribute("loginID")!=null) {
			model.addAttribute("myLikeList",map.get("myLikeList"));
		}
		
		return "/class/classList";
	}
	
	
	
	// 검색 결과 목록으로 이동
	@RequestMapping("search") 
	public String search(String category, int page, String searchContents, Model model) throws Exception{
		
		Map<String,String> map = cServ.selectBySearch(category, page, searchContents);

		//json을 List<Map<String,String>>로 변환하여 model에 담기
		Type listType = new TypeToken<List<Map<String,String>>>() {}.getType();		
		List<Map<String,String>> list = g.fromJson(map.get("list"), listType);	
		
		model.addAttribute("list", list);
		
		//json을 List<ImgDTO>로 변환하여 model에 담기
		Type listType2 = new TypeToken<List<ImgDTO>>() {}.getType();
		List<ImgDTO> mImgList = g.fromJson(map.get("mImgList"), listType2);
		model.addAttribute("mImgList",mImgList);
		
		//현재 페이지 위치를 model에 담기
		model.addAttribute("currPage",page);
		
		//해당 카테고리의 총 페이지 수를 model에 담기
		model.addAttribute("lastPage",map.get("lastPage"));
		
		//로그인시 해당 아이디로 찜한 클래스 목록을 model에 담기
		if((String)session.getAttribute("loginID")!=null) {
			model.addAttribute("myLikeList",map.get("myLikeList"));
		}
		
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
		
		return cServ.addClassFile(file);
	}
	
	
	
	// 이미지 서버에서 삭제 (ajax)
	@ResponseBody
	@RequestMapping(value="deleteFile",produces="text/html;charset=utf8")
	public String deleteFile(String sys_name) throws Exception{
		
		return cServ.deleteClassFile(sys_name).toString();
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
		model.addAttribute("cdtoNN", g.fromJson(map.get("cdtoNN"), Map.class));
		
		//ImgDTO를 담은 jsonArray를 model에 담기
		model.addAttribute("arrImg",map.get("arrImg"));
		
		//사용자의 해당 클래스 찜 여부를 model에 담기
		model.addAttribute("likeOrNot",map.get("likeOrNot"));
		
		//클래스의 총 수강 인원을 model에 담기
		model.addAttribute("stdsNum",map.get("stdsNum"));
		
		//클래스의 총 찜하기 수를 model에 담기
		model.addAttribute("likeNum",map.get("likeNum"));
		
		//리뷰목록을 List<Map<String,String>>으로 변환 하여 model에 담기
		Type listType = new TypeToken<List<Map<String,Object>>>() {}.getType();		
		List<Map<String,Object>> rlist = g.fromJson(map.get("rlist"), listType);	
		model.addAttribute("rlist", rlist);
		
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
	public String toReg(String class_seq,Model model) throws Exception{	
		
		//ClassDTO 와 메인 이미지 ImgDTO를 json화 해서 받아옴
		Map<String, String> map = cServ.selectRegBySeq(class_seq);
		
		//json을 classDTO로 변환하여 model에 담기
		model.addAttribute("cdto", g.fromJson(map.get("cdto"), ClassDTO.class));
		
		//json을 ImgDTO로 변환하여 model에 담기
		model.addAttribute("idto", g.fromJson(map.get("idto"), ImgDTO.class));
		
		//구매 seq를 model에 담기
		model.addAttribute("regStds_seq",map.get("regStds_seq"));
		
		return "/class/classReg";
	}
	
	
	
	// 클래스 구매 처리(ajax)
	@ResponseBody
	@RequestMapping("reg")
	public Boolean reg(int regStds_seq, String parent_seq,String type) throws Exception{
		
		String std_id = (String)session.getAttribute("loginID");
		Boolean regFin = false;
		if(cServ.reg(regStds_seq, std_id, type, parent_seq)>0) {
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
	
	
	
	// 클래스 구매 취소 페이지로 이동
		@RequestMapping("toRefund")
		public String toRefund(String class_seq,Model model) throws Exception{	
			
			//ClassDTO 와 메인 이미지 ImgDTO를 json화 해서 받아옴
			Map<String, String> map = cServ.selectRefundBySeq(class_seq);
			
			//json을 classDTO로 변환하여 model에 담기
			model.addAttribute("cdto", g.fromJson(map.get("cdto"), ClassDTO.class));
			
			//json을 ImgDTO로 변환하여 model에 담기
			model.addAttribute("idto", g.fromJson(map.get("idto"), ImgDTO.class));
			
			// 취소 처리할 구매 내역 받아오기 (RegStdsDTO)
			model.addAttribute("rsdto", g.fromJson(map.get("rsdto"), RegStdsDTO.class));
			return "/class/classRefund";
		}
	
		
		
	// 클래스 취소 처리(ajax)
		@ResponseBody
		@RequestMapping("refund")
		public Boolean refund(int regStds_seq) throws Exception{
			
			Boolean refundOk = false;
			if(cServ.refund(regStds_seq)>0) {
				refundOk=true;
			}
			return refundOk;
		}
		
		
		
	// 취소 완료 페이지로 이동
		@RequestMapping("refundFin")
		public String refundFin() throws Exception{
					
			return "/class/classRefundF";
		}
		
	// 신고 관련	
	
//	// 신고 여부 확인 (사용x - 프론트에서 state로 확인)
//	@ResponseBody
//	@RequestMapping("reportOrNot")
//	public Boolean reportOrNot(String parent_seq) throws Exception{
//		
//		String reporter = (String)session.getAttribute("loginID");
//		Boolean result = false;
//		if(cServ.reportOrNot(reporter,parent_seq)>0) {
//			result = true;
//		}
//		return result;
//	}
	
	// 신고 접수
	@ResponseBody
	@RequestMapping("report")
	public void report(ReportDTO rdto) throws Exception{
		
		String reporter = (String)session.getAttribute("loginID");
		rdto.setReporter(reporter);
		cServ.report(rdto);
	}
	
	
	
	// 클래스 삭제
	@ResponseBody
	@RequestMapping("delete")
	public Boolean delete(String class_seq) throws Exception{
		
		Boolean result = false;
		if(cServ.delete(class_seq)>0) {
			result = true;
		};
		
		return result;
	}
	
	
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
