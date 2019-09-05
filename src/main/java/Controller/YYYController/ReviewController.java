package Controller.YYYController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Command.YYYCommand.ReviewCommand;
import Model.DTO.YYYDTO.Review;
import Service.YYYService.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	
	@RequestMapping(value = "/reviewAction", method = RequestMethod.POST)
	public String create(@ModelAttribute Review review, HttpServletRequest request, HttpSession session) {
		System.out.println("리뷰등록할때 뷰에서 넘어오는 상품번호 : " + review.getGoodsNum());
		
        return reviewService.makeReview(review, request, session);
        
    }
}
