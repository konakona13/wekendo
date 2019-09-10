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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Command.YYYCommand.ReviewCommand;
import Model.DTO.YYYDTO.DodoY;
import Model.DTO.YYYDTO.Review;
import Repository.YYYRepository.ReviewRepository;
import Service.YYYService.KendoListYService;
import Service.YYYService.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	//리뷰화면
	@RequestMapping("/kendoReview")
	public String getDoGoods(Model model, @RequestParam(value = "dodoNum") String doNum) {
		System.out.println(doNum);	
		
		return reviewService.getDoGoods(model, doNum);
	}
	
	//리뷰 DB저장
	@RequestMapping(value = "/reviewAction", method = RequestMethod.POST)
	public String create(Review review, HttpServletRequest request, HttpSession session) {
		System.out.println("리뷰등록할때 뷰에서 넘어오는 상품번호 : " + request.getParameter("goodsNum"));
		
        return reviewService.makeReview(review, request, session);
        
    }
}
