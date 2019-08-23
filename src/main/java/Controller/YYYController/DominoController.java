package Controller.YYYController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Model.DTO.YYYDTO.MapLarge;
import Model.DTO.YYYDTO.MapMedium;
import Model.DTO.YYYDTO.ThemeLarge;
import Model.DTO.YYYDTO.ThemeMedium;
import Service.YYYService.DominoService;

@Controller
public class DominoController {
	
	@Autowired
	private DominoService dominoService;
	
	
	//지역
		@RequestMapping("/mapL")
		public String domino(Model model) {
			dominoService.execute(model);
			
			return "YYYView/map_theme/mapLarge_main";		
		}
		@RequestMapping(value = "/mapM", method=RequestMethod.POST)
		public String bb(Model model, MapLarge large) {
			//System.out.println("컨트롤로 지역대분류: " + large.getMapLName());
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
			//System.out.println("컨트롤로 테마대분류: " + themeLarge.getThemeLName());
			dominoService.execute4(model, themeLarge);
			return "YYYView/map_theme/themeMedium";
		}
		
		@RequestMapping(value = "/themeS", method=RequestMethod.POST)
		public String themeSmall(Model model, ThemeMedium themeMedium) {
			dominoService.execute5(model, themeMedium);
			return "YYYView/map_theme/themeSmall";
		}

}
