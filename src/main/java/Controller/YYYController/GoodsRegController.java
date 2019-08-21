package Controller.YYYController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Command.YYYCommand.PlaceRegCommand;
import Model.DTO.YYYDTO.MapLarge;
import Model.DTO.YYYDTO.MapMedium;
import Model.DTO.YYYDTO.MapSmall;
import Model.DTO.YYYDTO.PlaceGoods;
import Model.DTO.YYYDTO.ThemeLarge;
import Model.DTO.YYYDTO.ThemeMedium;
import Service.YYYService.DominoService;
import Service.YYYService.GoodsListService;
import Service.YYYService.PlaceRegService;

@Controller
public class GoodsRegController {
	@Autowired
	private PlaceRegService placeRegService;
	@Autowired
	private DominoService dominoService;
	@Autowired
	private PlaceGoods dto;
	
	@RequestMapping(value = "/GoodsReg", method = {RequestMethod.POST,RequestMethod.GET})
	public String goodsReg(Model model, PlaceRegCommand command) {
		
		return "YYYView/goodsRegist";
	} 
	
	@RequestMapping(value = "/GoodsRegAction", method = RequestMethod.POST)
	public String goodsRegAction(Model model, PlaceGoods dto, PlaceRegCommand command, Errors errors) {
		System.out.println("goodsRegAction : " + command.getMapLNum());
		
		String path= placeRegService.goodsRegist(model, command);

		return path;
	}
	
	@RequestMapping(value = "/GoodsRegDetail", method = RequestMethod.POST)
	public String goodsList(Model model, PlaceRegCommand 
			command, Errors errors) {
		String path="YYYView/goodsRegDetail";

		return path;
	}
	
	//ㅊ지역
	@RequestMapping("/mapL")
	public String domino(Model model) {
		dominoService.execute(model);
		
		return "YYYView/map_theme/mapLarge_main";		
	}
	@RequestMapping(value = "/mapM", method=RequestMethod.POST)
	public String bb(Model model, MapLarge large) {
		dominoService.execute1(model, large);
		return "YYYView/map_theme/mapMedium";
	}
	
	@RequestMapping(value = "/mapS", method=RequestMethod.POST)
	public String cc(Model model, MapMedium medium) {
		dominoService.execute2(model, medium);
		return "YYYView/map_theme/mapSmall";
	}
	//도미노 - 테마
	@RequestMapping("/themeL")
	public String themeLarge(Model model) {
		dominoService.execute3(model);
		
		return "YYYView/map_theme/theme_main";		
	}
	@RequestMapping(value = "/themeM", method=RequestMethod.POST)
	public String themeMedium(Model model, ThemeLarge themeLarge ) {
		dominoService.execute4(model, themeLarge);
		return "YYYView/map_theme/themeMedium";
	}
	
	@RequestMapping(value = "/themeS", method=RequestMethod.POST)
	public String themeSmall(Model model, ThemeMedium themeMedium) {
		dominoService.execute5(model, themeMedium);
		return "YYYView/map_theme/themeSmall";
	}

	

	

	
	
	
	
	}

