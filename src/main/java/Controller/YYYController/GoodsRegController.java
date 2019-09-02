package Controller.YYYController;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Command.LEECommand.AuthInfo;
import Command.YYYCommand.AuthInfoCommand;
import Command.YYYCommand.PlaceRegCommand;
import Command.YYYCommand.ReviewCommand;
import Model.DTO.YYYDTO.Review;
import Model.DTO.YYYDTO.ReviewList;
import Service.YYYService.GoodsDetailService;
import Service.YYYService.GoodsRegService;
import Service.YYYService.ReviewService;

@Controller
public class GoodsRegController {
	@Autowired
	private GoodsRegService placeRegService;
	@Autowired
	private GoodsDetailService detailService;
	@Autowired
	private ReviewService reviewService;


	//상품 등록
	@RequestMapping(value = "/goodsReg", method = {RequestMethod.POST,RequestMethod.GET})
	public String goodsReg(Model model, PlaceRegCommand command, HttpSession session) {
		AuthInfo authInfo =(AuthInfo) session.getAttribute("comAuth");
		String companyNum = authInfo.getComNum();
		String companyKind = companyNum.substring(0, 3);
		System.out.println(companyKind);
		model.addAttribute("comKind", companyKind);
		return "YYYView/goodsRegist";
	} 
	
	@RequestMapping(value = "/goodsRegAction", method = RequestMethod.POST)
	public String goodsRegAction(Model model, PlaceRegCommand command, HttpSession session, 
								 MultipartFile[]  report, HttpServletRequest request) throws IllegalStateException, IOException {
		
		//System.out.println("상품등록완료_지역소분류번호 : " + command.getMapSNum());
		//System.out.println("상품등록완료_테마소분류번호: " + command.getThemeSNum());
		System.out.println("뷰에서 입력한 이미지 장수: " + report.length);
		
		String path = placeRegService.goodsRegist(model, command, session, report, request);	

		return path;
	}
	
	//상세보기
	@RequestMapping("/goodsRegDetail.goods/{num}")
	public String goodsDetail(@PathVariable("num") String goodsNum, Model model, HttpSession session) {		
		System.out.println("상세보기 - 뷰단에서 받아오는 상품번호: " + goodsNum);
		
		return detailService.goodsDetail(goodsNum, model, session);
	}
	
	//리뷰
	/*@RequestMapping(value = "/reviewAction", method = RequestMethod.POST)
	public String makeReview(Review review, HttpSession session) {
		
        return reviewService.makeReview(review, session);
        
    }
	
	@RequestMapping("/reviewList")
    public List<ReviewList> reviewList(@RequestParam String goodsNum, Model model){
		List<ReviewList> reviewList = reviewService.reviewList(model, goodsNum);
        return reviewList;
    }*/


	

	
	
	

	}

