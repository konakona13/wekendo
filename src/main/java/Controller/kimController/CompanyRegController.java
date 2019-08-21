package Controller.kimController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Repository.kimRepository.UpdateComRegRepository;
import Service.kimService.UpdateComRegService;

@Controller
public class CompanyRegController {
	String path = "";
	
	@Autowired
	private UpdateComRegService updateComRegService;
	
	@RequestMapping("/companyReg")
	public String companyReg(Model model) {
		return updateComRegService.updateCompanyReg(model);
	}
	
	
	@RequestMapping("/companyRegDetail/{num}")
	public String companyRegDetail(@PathVariable("num") String companyName, Model model) {
		path = updateComRegService.companyDetail(companyName, model);
		return path;
	}

	@RequestMapping("/companyRegDetail/comRegOk")
	public String comRegOk(@RequestParam("chkComNum") String companyNum, Model model) {
		System.out.println("comRegOk : " + companyNum);
		updateComRegService.comRegOk(companyNum,model);
		return "redirect:../companyReg";
	}

}
