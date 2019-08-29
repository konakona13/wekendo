package Service.LEEService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.LEEDTO.Dodo;
import Model.DTO.LEEDTO.Dodo2;
import Repository.LEERepository.AdminSessionRepository;

@Service
public class KendoListService {

	@Autowired
	private AdminSessionRepository adminSessionRepository;

	public String doList(Model model, String page) {
		// TODO Auto-generated method stub
		int page1 = Integer.parseInt(page);
		int limit = 10;
		List<Dodo> list = adminSessionRepository.getDoList(page1, limit);

		int listCount = adminSessionRepository.getDoListCount();
		int maxPage = (int) ((double) listCount / limit + 0.95);
		int startPage = (int) (((double) page1 / 10 + 0.9) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > maxPage)
			endPage = maxPage;

		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", page1);
		model.addAttribute("listcount", listCount);
		model.addAttribute("dodos", list);
		return "LEEview/kendoList";
	}

	/*
	public String doDetail(Model model, String doNum) {
		// TODO Auto-generated method stub
		Dodo dodo = adminSessionRepository.getDoDetail(doNum);
		model.addAttribute("doDetail", dodo);
		return "LEEview/doDetail";
	}
	*/
	
	public String doGoodsDetail(Model model, String doNum1) {
		// TODO Auto-generated method stub
		Dodo dodo = adminSessionRepository.getDoDetail(doNum1);
		List<Dodo2> dodo2 = adminSessionRepository.getDoinGoodsDetail(doNum1);
		model.addAttribute("doDetail", dodo);
		model.addAttribute("dodos2", dodo2);
		return "LEEview/doDetail";
	}
}
