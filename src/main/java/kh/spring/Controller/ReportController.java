package kh.spring.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/report/")
public class ReportController {

	@RequestMapping("memberList")
	public String toList(){
		return "/report/member";
	}
	
}
