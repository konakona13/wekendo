package Controller.YYYController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Command.YYYCommand.PlaceGoodsRegCommand;
import Service.YYYService.PlaceGoodsRegService;

@Controller
public class GoodsRegController {
	@Autowired
	private PlaceGoodsRegService placeRegService;
	
	
	@RequestMapping(value = "/goodsReg", method = {RequestMethod.POST,RequestMethod.GET})
	public String joinMember(Model model, PlaceGoodsRegCommand command) {
		return "YYYView/goodsMain";
	} 
	
	@RequestMapping(value = "/GoodsRegAction", method = RequestMethod.POST)
	public String memberJoinAction(Model model, PlaceGoodsRegCommand 
			command, Errors errors) {
		String path="";
		
		if(errors.hasErrors()) return "YYYView/goodsRegist";
		try {
		   path = placeRegService.goodsRegist(model, command);
		}catch(Exception e) { }
		return path;
	}
	
	
	}

