package Service.YYYService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.LEEDTO.Dodo;
import Model.DTO.LEEDTO.Dodo2;
import Model.DTO.YYYDTO.DodoY;
import Model.DTO.YYYDTO.Review;
import Repository.YYYRepository.ReviewRepository;

@Service
public class KendoListYService {
	@Autowired
	private ReviewRepository reviewRepository;

	public List<DodoY> doList(Model model, String memNum) {
		
		List<DodoY> list = reviewRepository.getDoList(memNum);
		Review review = reviewRepository.getReview(memNum);
		model.addAttribute("review", review);
		
		return list;
	}



}
