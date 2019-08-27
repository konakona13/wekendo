package Service.YYYService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.PlaceGoods;
import Repository.YYYRepository.ConfirmRepository;

@Service
public class GoodsConfirmService {
	@Autowired
	ConfirmRepository confirmRepository;

	public String goodsConfirm(String goodsNum, Model model) {
		
		PlaceGoods goods = confirmRepository.goodsConfirm(goodsNum);
		model.addAttribute("goods", goods);
		
		return "redirect:../confirmList";
	}

}
