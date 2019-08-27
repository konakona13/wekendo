package Controller.YYYController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Command.YYYCommand.PlaceRegCommand;
import Model.DTO.YYYDTO.Company;
import Service.YYYService.ConfirmListServcie;
import Service.YYYService.GoodsCancelService;
import Service.YYYService.GoodsConfirmService;

@Controller
public class ConfirmController {
	@Autowired ConfirmListServcie confirmListService;
	@Autowired GoodsConfirmService goodsConfirmService;
	@Autowired GoodsCancelService goodsCancelService;
	
	//상품등록리스트_관리자페이지
	@RequestMapping(value ="/confirmList")
	public String confirmList(Model model, HttpSession session) { 
		String path = confirmListService.getGoodsDetail(model, session);		
		
		return path;
	}

	//"승인완료"
	@RequestMapping("/confirmList/ok")
	public String goodsConfirm(@RequestParam("goodsNum") String goodsNum, Model model) { 
		System.out.println("goodsNum1: " + goodsNum);
		String path = goodsConfirmService.goodsConfirm(goodsNum, model);		
		
		return path;
	}
	
	//"승인거부"
	@RequestMapping(value ="/confirmList/no", method = RequestMethod.POST)
	public String goodsCancel(Model model, String goodsNum) { 
		String path = goodsCancelService.goodsCancel(model, goodsNum);		
		
		return path;
	}	

}
