package Service.YYYService;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.PlaceGoods;
import Repository.YYYRepository.GoodsRepository;

@Service
public class ConfirmListServcie {
	
	@Autowired  GoodsRepository repository;


	public String getGoodsDetail(Model model, HttpSession session) {
		session.getAttribute("comNum");
		List<PlaceGoods> goods = repository.getGoodsList();
		model.addAttribute("list", goods);
		
		return "YYYView/goodsConfirm";
	}


}
