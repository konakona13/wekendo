package Service.kimService;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import Command.LEECommand.AuthInfo;
import Model.DTO.LEEDTO.Buybuy;
import Model.DTO.LEEDTO.CashIn;
import Model.DTO.LEEDTO.Member;
import Model.DTO.kimDTO.Company;
import Repository.kimRepository.UpdateComRegRepository;

@Service
public class UpdateComRegService {

	
	@Autowired
	private UpdateComRegRepository updateComRegRepository;

	public void companyRegList(Model model) {	
	}

	public String updateCompanyReg(Model model) {
		List<Company> list = updateComRegRepository.updateCompanyReg();
		model.addAttribute("updateComReg",list);
		return "kimView/companyReg" ;
	}

	public String companyDetail(String companyName,Model model) {
		Company company = updateComRegRepository.selectCompanyDetail(companyName);
		 /*
		System.out.println("CompanyNum : " + company.getCompanyNum());
		System.out.println("CompanyName : " + company.getCompanyName());
		System.out.println("CompanyKind : " + company.getCompanyKind());
		System.out.println("CompanyPh : " + company.getCompanyPh());
		System.out.println("CompanyEmail : " + company.getCompanyEmail());
		*/
		
		model.addAttribute("companyDetail",company);
		String path = "kimView/companyRegDetail";
		return path;
	}

	public String comRegOk(String companyNum, Model model) {
		Company company = updateComRegRepository.comRegOk(companyNum);

		return "./view/kimView/companyReg";
		
	}

	public String memcomList(Model model, String page) {
		int page1 = Integer.parseInt(page);
		int limit = 10;
		List<Member> memList = updateComRegRepository.getMemList(page1, limit);
		List<Company> comList = updateComRegRepository.getComList(page1, limit);

		int listCount1 = updateComRegRepository.getMemListCount();
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
		
		int listCount2 = updateComRegRepository.getComListCount();
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
		return "kimView/adminMain2";
	}



	public String cashAndBuyList(Model model, HttpSession session, String page) {
		int page1 = Integer.parseInt(page);
		int limit = 10;
		AuthInfo authInfo = (AuthInfo) session.getAttribute("comAuth");
		String comName = authInfo.getName();
		List<CashIn> listCashin = updateComRegRepository.getComNameCashList(page1, limit, comName);
		List<Buybuy> listBuybuy = updateComRegRepository.getNameBuyList(page1, limit, comName);
		
		int listCashCount = updateComRegRepository.getCashListCount();
		int listBuyCount = updateComRegRepository.getBuyListCount();
		
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
		return "kimView/companyMain2";
	}





}
