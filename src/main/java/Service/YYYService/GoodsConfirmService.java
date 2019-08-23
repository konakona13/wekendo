package Service.YYYService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.YYYCommand.PlaceRegCommand;
import Model.DTO.YYYDTO.Company;
import Model.DTO.YYYDTO.PlaceGoods;
import Repository.YYYRepository.ConfirmRepository;

@Service
public class GoodsConfirmService {
	@Autowired
	ConfirmRepository confirmRepository;

	public String goodsConfirm(Model model, String goodsNum) {
		
		PlaceGoods goods = confirmRepository.goodsConfirm(goodsNum);
		model.addAttribute("goods", goods);
		
		return "YYYView/goodsConfirm";
	}

}
