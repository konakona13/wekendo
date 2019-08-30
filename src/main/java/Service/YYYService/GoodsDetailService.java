package Service.YYYService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.Company;
import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.Goods;
import Repository.YYYRepository.GoodsRepository;

@Service
public class GoodsDetailService {
	@Autowired
	private  GoodsRepository goodsRepository;

	

	public String goodsDetail(String goodsNum, Model model, HttpSession session) {
		
		System.out.println(goodsNum);
		Goods goods = goodsRepository.getGoodsDetail(goodsNum);
		model.addAttribute("goods", goods);
		System.out.println("서비스 상세보기 상품이름 : " +goods.getGoodsName()); //디버깅코드
		
		//회사명 가져오기 위해 기업회원 테이블 참조
		String companyNum = (String) session.getAttribute("comNum");
		//System.out.println("상세보기 - 뷰단에서 받아오는 회사번호: " + session.getAttribute("comNum"));
		Company company = goodsRepository.getCompanyDetail(companyNum);
		//System.out.println("갑자기 왜안되? : " + companyNum);
		model.addAttribute("company", company);
		//System.out.println("서비스 상세보기 회사번호 : " +company.getCompanyName()); //디버깅코드
		
		//이미지 가져오기
		List<GoodsImg> goodsImg = new ArrayList<GoodsImg>();
		goodsImg = goodsRepository.getImages(goodsNum);
		System.out.println("이미지테이블에서 불러오는 상품번호 : " + goodsNum);
		model.addAttribute("imgList", goodsImg);
		System.out.println("서비스 상세보기 이미지장수 : " +goodsImg.size());
		
		//지역 및 테마명 가져오기 위해 각 테이블 참조
		
		/*goods.getMapLNum()
		
		if(goodsNum.equals(anObject))
		mapTheme.setMapLName();
		model.addAttribute("mapTheme", mapTheme);*/
		
		String path = "YYYView/goodsRegDetail";
		return path;
	}




}
