package kh.spring.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/center/")
public class ServiceCenterController {
	
	@RequestMapping("main")
	public String main() {
		return "/center/centerList";
	}
	
	@RequestMapping("inquiry")
	public String inquiry() {
		return "/center/centerWrite";
	}
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();

		return "error";
	}

}
