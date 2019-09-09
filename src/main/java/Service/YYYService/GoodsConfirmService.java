package Service.YYYService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.Goods;

import Repository.YYYRepository.ConfirmRepository;

@Service
public class GoodsConfirmService {
	@Autowired
	ConfirmRepository confirmRepository;

	public String goodsConfirm(String goodsNum, Model model) {
		
		Goods goods = confirmRepository.goodsConfirm(goodsNum);
		model.addAttribute("goods", goods);
		
		System.out.println("승인여부 :" + goods.getGoodsStatus());
		
		return "YYYView/goodsConfirm2" ;
	}

}
