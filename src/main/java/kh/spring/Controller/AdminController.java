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
	
	@RequestMapping("memberPage")
	public String memberPage() {
		return "/admin/adminMemberPage";
	}
	
	@RequestMapping("memberClass")
	public String memberClass() {
		return "/admin/adminMemberClass";
	}
}
