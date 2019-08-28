package Service.YYYService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Repository.YYYRepository.GoodsRepository;

public class GoodsDeleteService {
	
	@Autowired
	private GoodsRepository goodsRepository;

	public String goodsDelete(String goodsNum, Model model, HttpSession session) {
		
		goodsRepository.deleteGoods(goodsNum);
		
		String path = "redirect:../goodsMain";
		
		return path;
	}

}
