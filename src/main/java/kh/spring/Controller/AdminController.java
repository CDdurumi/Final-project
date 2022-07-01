package kh.spring.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@RequestMapping("adminMain")
	public String adminMemberList() {
		return "/admin/adminMain";
	}
	
	@RequestMapping("test")
	public String test() {
		return "/admin/test";
	}
}
