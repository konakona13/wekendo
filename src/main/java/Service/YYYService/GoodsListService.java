package Service.YYYService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.PlaceGoods;
import Repository.YYYRepository.GoodsRepository;


@Service
public class GoodsListService {
	
	@Autowired
	private GoodsRepository repository;
	

	public String goodsList(Model model) {
		List<PlaceGoods> list = repository.getGoodsList();
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
