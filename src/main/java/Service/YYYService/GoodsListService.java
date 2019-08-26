package Service.YYYService;

import java.util.List;

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
	

	public String goodsList(Model model, HttpSession session) {
		
		String companyNum = (String) session.getAttribute("comNum");
		List<Company> company = goodsRepository.getCompanyList(companyNum);
		model.addAttribute("company", company);
		
		List<PlaceGoods> list = goodsRepository.getGoodsList();
		model.addAttribute("list", list);
		
		System.out.println("List테스트     " + list.size());
		
		/*
		 * List<GoodsImg> images = repository.getGoodsImg();
		 * model.addAttribute("images", images);
		 */
		
		//System.out.println("Images테스트     " + images.size());
		
		return "YYYView/goodsMain";
	}

	
}
