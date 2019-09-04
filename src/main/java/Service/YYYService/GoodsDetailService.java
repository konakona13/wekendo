package Service.YYYService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.Company;
import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.GoodsList;
import Model.DTO.YYYDTO.MapTheme;
import Model.DTO.YYYDTO.Review;
import Model.DTO.YYYDTO.ReviewList;
import Model.DTO.YYYDTO.Goods;
import Repository.YYYRepository.GoodsRepository;
import Repository.YYYRepository.ReviewRepository;

@Service
public class GoodsDetailService {
	@Autowired
	private  GoodsRepository goodsRepository;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ReviewRepository reivewRepository;
	@Autowired
	private MapTheme mapTheme;
	
	public MapTheme getMapTheme() {
		return mapTheme;
	}


	public String goodsDetail(String goodsNum, Model model, HttpSession session) {
		
		//상품정보 가져오기
		//System.out.println("상세보기-상품번호: " +goodsNum);
		Goods goods = goodsRepository.getGoodsDetail(goodsNum);
		model.addAttribute("goods", goods);

		
		//회사정보 가져오기
		GoodsList goodsList = (GoodsList) goodsRepository.getCompanyInfo(goodsNum);
		model.addAttribute("goodsList", goodsList);
		System.out.println(goodsList.toString());
		
		//이미지 가져오기
		List<GoodsImg> goodsImg = new ArrayList<GoodsImg>();
		goodsImg = goodsRepository.getimages(goodsNum);
		System.out.println("이미지테이블에서 불러오는 상품번호 : " + goodsNum);
		model.addAttribute("imgList", goodsImg);
		System.out.println("서비스 상세보기 이미지장수 : " +goodsImg.size());
		
		//지역 및 테마명 가져오기
		MapTheme mapTheme = (MapTheme)goodsRepository.getDominoDetail(goodsNum);
		model.addAttribute("mapTheme", mapTheme);
		//System.out.println(mapTheme.toString());
		
		//리뷰 가져오기
		/*List<ReviewList> review = reivewRepository.getReview(goodsNum);
        model.addAttribute("review", review);*/
		
		return "YYYView/goodsRegDetail";
	}




}
