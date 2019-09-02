package Controller.YYYController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Command.YYYCommand.ReviewCommand;
import Model.DTO.YYYDTO.Review;
import Service.YYYService.ReviewService;

@RestController
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	
	@RequestMapping(value = "/reviewAction/a", method = RequestMethod.POST)
	public String create(Review review, HttpSession session) {
		System.out.println("리뷰등록할때 커맨드에 담긴 상품번호 : " + review.getGoodsNum());
		reviewService.makeReview(review, session);
		
        return review.toString();
        
    }
}
