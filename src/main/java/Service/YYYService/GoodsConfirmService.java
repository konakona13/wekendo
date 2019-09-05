package Service.YYYService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.Goods;
import Model.DTO.YYYDTO.GoodsList;
import Repository.YYYRepository.ConfirmRepository;

@Service
public class GoodsConfirmService {
	@Autowired
	ConfirmRepository confirmRepository;

	public String goodsConfirm(String goodsNum, Model model) {
		
		Goods goods = confirmRepository.goodsConfirm(goodsNum);
		model.addAttribute("goods", goods);
		
		return "redirect:../confirmList";
	}

}
