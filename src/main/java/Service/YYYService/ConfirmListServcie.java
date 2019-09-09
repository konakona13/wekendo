package Service.YYYService;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.GoodsList;
import Model.DTO.YYYDTO.Goods;
import Repository.YYYRepository.GoodsRepository;

@Service
public class ConfirmListServcie {
	
	@Autowired  GoodsRepository repository;


	public String getGoodsDetail(Model model, HttpSession session) {
		session.getAttribute("comNum");
		List<GoodsList> goods = repository.getGoodsAll();		
		model.addAttribute("list", goods);
		model.addAttribute("qty", goods.size());
		
		//System.out.println(goods.toString());
		
		return "YYYView/goodsConfirm";
	}


}
