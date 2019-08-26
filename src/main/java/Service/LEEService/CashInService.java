package Service.LEEService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.DTO.LEEDTO.Buybuy;
import Model.DTO.LEEDTO.CashIn;
import Repository.LEERepository.AdminSessionRepository;

@Service
public class CashInService {

	@Autowired
	private AdminSessionRepository adminSessionRepository;

	public String listCashBuy(Model model, String page) {
		// TODO Auto-generated method stub
		int page1 = Integer.parseInt(page);
		int limit = 10;
		List<CashIn> listCashin = adminSessionRepository.getCashList(page1, limit);
		List<Buybuy> listBuybuy = adminSessionRepository.getBuyList(page1, limit);

		int listCashCount = adminSessionRepository.getCashListCount();
		int listBuyCount = adminSessionRepository.getBuyListCount();

		int maxPageCash = (int) ((double) listCashCount / limit + 0.95);
		int startPageCash = (int) (((double) page1 / 10 + 0.9) - 1) * 10 + 1;
		int endPageCash = startPageCash + 10 - 1;
		if (endPageCash > maxPageCash)
			endPageCash = maxPageCash;

		int maxPageBuy = (int) ((double) listBuyCount / limit + 0.95);
		int startPageBuy = (int) (((double) page1 / 10 + 0.9) - 1) * 10 + 1;
		int endPageBuy = startPageBuy + 10 - 1;
		if (endPageBuy > maxPageBuy)
			endPageBuy = maxPageBuy;

		model.addAttribute("maxPageCash", maxPageCash);
		model.addAttribute("startPageCash", startPageCash);
		model.addAttribute("endPageCash", endPageCash);
		model.addAttribute("maxPageBuy", maxPageBuy);
		model.addAttribute("startPageBuy", startPageBuy);
		model.addAttribute("endPageBuy", endPageBuy);
		model.addAttribute("page", page1);
		model.addAttribute("listcashcount", listCashCount);
		model.addAttribute("listBuyCount", listBuyCount);
		model.addAttribute("cashins", listCashin);
		model.addAttribute("buybuys", listBuybuy);
		return "LEEview/cashList3";
	}

	public String buybuySearch(Model model, String comName, String page) {
		// TODO Auto-generated method stub
		int page1 = Integer.parseInt(page);
		int limit = 10;
		List<CashIn> listCashin = adminSessionRepository.getComNameCashList(page1, limit, comName);
		List<Buybuy> listBuybuy = adminSessionRepository.getNameBuyList(page1, limit, comName);

		int listCashCount = adminSessionRepository.getCashListCount();
		int listBuyCount = adminSessionRepository.getBuyListCount();

		int maxPageCash = (int) ((double) listCashCount / limit + 0.95);
		int startPageCash = (int) (((double) page1 / 10 + 0.9) - 1) * 10 + 1;
		int endPageCash = startPageCash + 10 - 1;
		if (endPageCash > maxPageCash)
			endPageCash = maxPageCash;

		int maxPageBuy = (int) ((double) listBuyCount / limit + 0.95);
		int startPageBuy = (int) (((double) page1 / 10 + 0.9) - 1) * 10 + 1;
		int endPageBuy = startPageBuy + 10 - 1;
		if (endPageBuy > maxPageBuy)
			endPageBuy = maxPageBuy;

		model.addAttribute("maxPageCash", maxPageCash);
		model.addAttribute("startPageCash", startPageCash);
		model.addAttribute("endPageCash", endPageCash);
		model.addAttribute("maxPageBuy", maxPageBuy);
		model.addAttribute("startPageBuy", startPageBuy);
		model.addAttribute("endPageBuy", endPageBuy);
		model.addAttribute("page", page1);
		model.addAttribute("listcashcount", listCashCount);
		model.addAttribute("listBuyCount", listBuyCount);
		model.addAttribute("cashins", listCashin);
		model.addAttribute("buybuys", listBuybuy);
		model.addAttribute("comName", comName);
		return "LEEview/cashList3";
	}

	public String cashInsert(Model model, String comName) {
		// TODO Auto-generated method stub
		adminSessionRepository.cashinInsert(comName);
		
		String path = "LEEview/cashList3";
		return path;
	}
}
