package kh.spring.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/class/")
public class ClassController {
	
	@RequestMapping("list")
	public String list() {
		return "/class/classList";
	}
	
	@RequestMapping("write")
	public String write() {
		return "/class/classWrite";
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
