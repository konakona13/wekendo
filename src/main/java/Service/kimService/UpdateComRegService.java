package Service.kimService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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

}
