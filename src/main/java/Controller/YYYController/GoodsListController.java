package Controller.YYYController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.PlaceGoods;
import Service.YYYService.GoodsListService;

@Controller
public class GoodsListController {
	@Autowired
	private GoodsListService listService;
	@Autowired
	private GoodsImg img;
	
	
	@RequestMapping(value = "/goodsMain", method = RequestMethod.GET)
	public String goodsList(Model model) { 
		String path= listService.goodsList(model);
		return path;
}
}
