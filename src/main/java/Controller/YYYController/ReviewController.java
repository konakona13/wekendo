package Controller.YYYController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {
	
	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public String review() {
		
		return "YYYView/goodsRegDetail";
		
	}
}
