package Service.YYYService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.YYYCommand.PlaceRegCommand;
import Model.DTO.YYYDTO.Company;
import Repository.YYYRepository.ConfirmRepository;

@Service
public class GoodsCancelService {
	@Autowired
	ConfirmRepository confirmRepository;

	public String goodsCancel(Model model) {
		
		Company company = confirmRepository.goodsCancel();
		model.addAttribute("company", company);
		
		return "YYYView/goodsConfirm";
	}
}
