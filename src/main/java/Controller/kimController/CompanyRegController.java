package Controller.kimController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Repository.kimRepository.UpdateComRegRepository;
import Service.LEEService.CompanyCashService;
import Service.LEEService.MemListService;
import Service.kimService.UpdateComRegService;

@Controller
public class CompanyRegController {
	String path = "";
	
	@Autowired
	private UpdateComRegService updateComRegService;
	
	@Autowired
	private MemListService memListService;
	@Autowired
	private CompanyCashService companyCashService;

	
	@RequestMapping("/companyReg")
	public String companyReg(Model model) {
		return updateComRegService.updateCompanyReg(model);
	}
	
	
	@RequestMapping("/companyRegDetail/{num}")
	public String companyRegDetail(@PathVariable("num") String companyNum, Model model) {
		path = updateComRegService.companyDetail(companyNum, model);
		return path;
	}

	@RequestMapping("/companyRegDetail/comRegOk")
	public String comRegOk(@RequestParam("chkComNum") String companyNum, Model model) {
		System.out.println("comRegOk : " + companyNum);
		updateComRegService.comRegOk(companyNum,model);
		return "redirect:../companyReg";
	}
	
	@RequestMapping("/adminMain2")
	public String adminMain(Model model, @RequestParam(value = "page", defaultValue = "1") String page) {
		return updateComRegService.memcomList(model, page);
	}
	
	@RequestMapping("/companyMain2")
	public String companyMain2(Model model, HttpSession session, @RequestParam(value = "page", defaultValue = "1") String page ){
		return companyCashService.cashAndBuyList(model, session, page);

	}

}
