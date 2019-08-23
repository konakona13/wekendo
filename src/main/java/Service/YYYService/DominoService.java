package Service.YYYService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.MapLarge;
import Model.DTO.YYYDTO.MapMedium;
import Model.DTO.YYYDTO.MapSmall;
import Model.DTO.YYYDTO.ThemeLarge;
import Model.DTO.YYYDTO.ThemeMedium;
import Model.DTO.YYYDTO.ThemeSmall;
import Repository.YYYRepository.DominoRepository;

@Service
public class DominoService {
	
	@Autowired
	private DominoRepository reposiotry;

	
	public void execute(Model model) {
		List<MapLarge> result = reposiotry.selectMapL();
		model.addAttribute("result", result);
	}


	public void execute1(Model model , MapLarge large) {
		List<MapMedium> list = reposiotry.selectMapM(large);
		model.addAttribute("list", list);
		
	}


	public void execute2(Model model, MapMedium medium) {
		List<MapSmall> list = reposiotry.selectMapS(medium);
		model.addAttribute("list", list); 
		
	}


	public void execute3(Model model) {
		List<ThemeLarge> result2 = reposiotry.selectThemeL();
		model.addAttribute("result2", result2);
		
	}


	public void execute4(Model model, ThemeLarge themeLarge) {
		List<ThemeMedium> result3 = reposiotry.selectThemeM(themeLarge);
		model.addAttribute("result3", result3);		
		
		System.out.println("테마대분류:  " + themeLarge.getThemeLName());
	}


	public void execute5(Model model, ThemeMedium themeMedium) {
		List<ThemeSmall> result4 = reposiotry.selectThemeS(themeMedium);
		model.addAttribute("result4", result4);	
		
		System.out.println("테마중분류번호:  " + themeMedium.getThemeMName());
	}

}
