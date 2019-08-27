package Service.YYYService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.Company;
import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.PlaceGoods;
import Repository.YYYRepository.GoodsRepository;


@Service
public class GoodsListService {
	
	@Autowired
	private GoodsRepository goodsRepository;
	
	private String companyNum;
	

	public String goodsList(Model model, HttpSession session) {
		
		companyNum = (String)session.getAttribute("comNum");
		Company company = (Company) goodsRepository.getCompanyDetail(companyNum);
		model.addAttribute("company", company);
		
		List<PlaceGoods> list = new ArrayList<PlaceGoods>();
		System.out.println("받아오는 Service 회사번호 : " +companyNum);
		
		if(companyNum.equals("admin")) {
			System.out.println("받아오는 Service 회사번호 : " +companyNum);
			list = goodsRepository.getGoodsAll();
		} else {
			list = goodsRepository.getGoodsList(companyNum);
			System.out.println("회사번호 : " +companyNum);
		}
		model.addAttribute("list", list);
		
		
		System.out.println("상품리스트 게시글수 :  " + list.size());
		
		/*
		 * List<GoodsImg> images = repository.getGoodsImg();
		 * model.addAttribute("images", images);
		 */
		
		//System.out.println("Images테스트     " + images.size());
		
		return "YYYView/goodsMain";
	}

	
}
