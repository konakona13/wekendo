package Controller.YYYController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Command.YYYCommand.AuthInfoCommand;
import Command.YYYCommand.PlaceRegCommand;
import Model.DTO.YYYDTO.PlaceGoods;
import Service.YYYService.GoodsDetailService;
import Service.YYYService.PlaceRegService;

@Controller
public class GoodsRegController {
	@Autowired
	private PlaceRegService placeRegService;
	@Autowired
	private GoodsDetailService detailService;

	//상품 등록
	@RequestMapping(value = "/goodsReg", method = {RequestMethod.POST,RequestMethod.GET})
	public String goodsReg(Model model, PlaceRegCommand command, HttpSession session) {
		
		return "YYYView/goodsRegist";
	} 
	
	@RequestMapping(value = "/goodsRegAction", method = RequestMethod.POST)
	public String goodsRegAction(Model model, PlaceRegCommand command, HttpSession session, Errors errors) {
		
		//System.out.println("상품등록완료_지역소분류번호 : " + command.getMapSNum());
		//System.out.println("상품등록완료_테마소분류번호: " + command.getThemeSNum());
		
		String path= placeRegService.goodsRegist(model, command, session);
			
		return path;
	}
	
	//상세보기
	@RequestMapping("/goodsRegDetail.goods/{num}")
	public String goodsDetail(@PathVariable("num") PlaceRegCommand command, Model model, HttpSession session) {
		
		String path = detailService.goodsDetail(command, model, session);
		return path;
	}

	

	

	

	
	
	
	
	}

