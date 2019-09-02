package Service.YYYService;

import java.lang.reflect.Member;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.YYYCommand.AuthInfoCommand;
import Model.DTO.YYYDTO.Review;
import Model.DTO.YYYDTO.ReviewList;
import Repository.YYYRepository.ReviewRepository;

@Service
public class ReviewService {
	@Autowired
	private ReviewRepository reviewRepository;
	@Autowired
	private Review review;
	@Autowired
	private AuthInfoCommand authInfoCommand;


	public String makeReview(Review review, HttpSession session) {	
		
		String memberNum = (String) session.getAttribute("memNum");
		review.setMemberNum(memberNum);
		reviewRepository.makeReview(review);
		System.out.println(review);
		
		//회원테이블에서 이름 가져오기
	    memberNum = (String) session.getAttribute("memNum");
		authInfoCommand.setMemNum(memberNum);
		session.setAttribute("member", authInfoCommand);
		System.out.println("리뷰작성자(회원아이디): " + authInfoCommand.getName());
		
        return "redirect:../goodsRegDetail.goods/" + review.getGoodsNum();
		
	}

	public List<ReviewList> reviewList(Model model, String goodsNum) {
		 List<ReviewList> reviewList = reviewRepository.getReview(goodsNum);
		 model.addAttribute("review", reviewList);
		return reviewList;
	}

	public Review getReview() {
		return review;
	}

    
}
