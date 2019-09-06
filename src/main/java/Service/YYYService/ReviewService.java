package Service.YYYService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.YYYCommand.AuthInfoCommand;
import Model.DTO.YYYDTO.MapTheme;
import Model.DTO.YYYDTO.Review;
import Model.DTO.YYYDTO.ReviewList;
import Repository.YYYRepository.GoodsRepository;
import Repository.YYYRepository.ReviewRepository;

@Service
public class ReviewService {
	@Autowired
	private ReviewRepository reviewRepository;
	@Autowired
	private GoodsRepository goodsRepository;
	@Autowired
	private Review review;
	@Autowired
	private AuthInfoCommand authInfoCommand;


	public String makeReview(Review review, HttpServletRequest request, HttpSession session) {	
		
		String memberNum = (String) session.getAttribute("memNum");
		review.setMemberNum(memberNum);
		review.setGoodsNum(request.getParameter("goodsNum"));

		
		//지역 및 테마명 가져오기
		String goodsNum = request.getParameter("goodsNum");
		MapTheme mapTheme = (MapTheme)goodsRepository.getDominoDetail(goodsNum);
		review.setMapLNum(mapTheme.getMapLNum());
		review.setMapMNum(mapTheme.getMapMNum());
		review.setMapSNum(mapTheme.getMapSNum());
		review.setThemeLNum(mapTheme.getThemeLNum());
		review.setThemeMNum(mapTheme.getThemeMNum());
		review.setThemeSNum(mapTheme.getThemeSNum());

		//System.out.println(mapTheme.toString());
		
		//회원테이블에서 이름 가져오기
	    memberNum = (String) session.getAttribute("memNum");
		authInfoCommand.setMemNum(memberNum);
		session.setAttribute("member", authInfoCommand);
		System.out.println("리뷰작성자(회원아이디): " + authInfoCommand.getName());
		
		
		reviewRepository.makeReview(review);
		System.out.println(review);
		
		
        return "redirect:../goodsRegDetail.goods/" + review.getGoodsNum();
		
	}

	//리뷰가져오기
/*	public List<ReviewList> reviewList(Model model, String goodsNum) {
		 List<ReviewList> reviewList = reviewRepository.getReview(goodsNum);
		 model.addAttribute("review", reviewList);
		return reviewList;
	}*/

	public Review getReview() {
		return review;
	}

    
}
