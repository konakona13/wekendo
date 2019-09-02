package Service.YYYService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.GoodsList;
import Repository.YYYRepository.GoodsRepository;

@Service
public class GoodsListMemServcie {
	@Autowired
	private GoodsRepository goodsRepository;

	public String goodsMember(Model model, HttpSession session) {
		List<GoodsList> list = new ArrayList<GoodsList>();
		list = goodsRepository.memGetGoods();
		model.addAttribute("list", list);
		
		return "YYYView/goodsMain";
	}

}
