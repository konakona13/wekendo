package Service.YYYService;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.Goods;
import Model.DTO.YYYDTO.GoodsList;
import Repository.YYYRepository.ConfirmRepository;
import Repository.YYYRepository.GoodsRepository;

@Service
public class GoodsConfirmService {
	@Autowired
	ConfirmRepository confirmRepository;
	@Autowired  GoodsRepository repository;

	public String goodsConfirm(String goodsNum, Model model) {
		
		Goods goods = confirmRepository.goodsConfirm(goodsNum);
		model.addAttribute("goods", goods);
		
		List<GoodsList> goodsList = repository.getGoodsAll();		
		model.addAttribute("list", goodsList);
		
		
		System.out.println("승인여부 :" + goods.getGoodsStatus());
		
		return "redirect:../confirmList" ;
	}

}
