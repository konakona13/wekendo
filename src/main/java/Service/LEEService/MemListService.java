package Service.LEEService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.LEEDTO.Company;
import Model.DTO.LEEDTO.Member;
import Repository.LEERepository.AdminSessionRepository;

@Service
public class MemListService {

	@Autowired
	private AdminSessionRepository adminSessionRepository;

	public String memcomList(Model model, String page) {
		// TODO Auto-generated method stub

		int page1 = Integer.parseInt(page);
		int limit = 10;
		List<Member> memList = adminSessionRepository.getMemList(page1, limit);
		List<Company> comList = adminSessionRepository.getComList(page1, limit);

		int listCount1 = adminSessionRepository.getMemListCount();
		int maxPage1 = (int) ((double) listCount1 / limit + 0.95);
		int startPage1 = (int) (((double) page1 / 10 + 0.9) - 1) * 10 + 1;
		int endPage1 = startPage1 + 10 - 1;
		if (endPage1 > maxPage1)
			endPage1 = maxPage1;

		model.addAttribute("maxPageM", maxPage1);
		model.addAttribute("startPageM", startPage1);
		model.addAttribute("endPageM", endPage1);
		model.addAttribute("pageM", page1);
		model.addAttribute("listcountM", listCount1);
		model.addAttribute("members", memList);
		
		int listCount2 = adminSessionRepository.getComListCount();
		int maxPage2 = (int) ((double) listCount2 / limit + 0.95);
		int startPage2 = (int) (((double) page1 / 10 + 0.9) - 1) * 10 + 1;
		int endPage2 = startPage2 + 10 - 1;
		if (endPage2 > maxPage2)
			endPage2 = maxPage2;

		model.addAttribute("maxPageC", maxPage2);
		model.addAttribute("startPageC", startPage2);
		model.addAttribute("endPageC", endPage2);
		model.addAttribute("pageC", page1);
		model.addAttribute("listcountC", listCount2);
		model.addAttribute("companys", comList);
		return "LEEview/memcomList";
	}

}
