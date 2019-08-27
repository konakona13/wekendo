package Service.YYYService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.YYYCommand.PlaceRegCommand;
import Model.DTO.YYYDTO.Company;
import Model.DTO.YYYDTO.PlaceGoods;
import Repository.YYYRepository.ConfirmRepository;

@Service
public class GoodsCancelService {
	@Autowired
	ConfirmRepository confirmRepository;

	public String goodsCancel(Model model, String goodsNum) {
		
		PlaceGoods placeGoods = confirmRepository.goodsCancel(goodsNum);
		model.addAttribute("placeGoods", placeGoods);
		
		return "YYYView/goodsConfirm";
	}
}
