package Service.LEEService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Command.LEECommand.CompanyJoinCommand;
import Model.DTO.LEEDTO.Company;
import Repository.LEERepository.SessionRepository;

public class CompanyJoinService {
	@Autowired
	private SessionRepository sessionRepository;

	private String path;

	public String comInsert(Model model, CompanyJoinCommand cjc, String comId, HttpServletRequest request,
			HttpSession session) {
		// TODO Auto-generated method stub
		Company com = new Company();
		com.setCompanyId(cjc.getId1());
		com.setCompanyPw(cjc.getPw());
		com.setCompanyName(cjc.getCompanyName());
		com.setCompanyBn(cjc.getCompanyBn());
		com.setManagerEmail(cjc.getManagerEmail());
		com.setCompanyAddr(cjc.getCompanyAddr());
		com.setCompanyPh(Long.valueOf(cjc.getCompanyPh()));
		com.setCompanyKind(request.getParameter("companyKind"));
		System.out.println(com.getCompanyKind());
		com.setCompanyCap(cjc.getCompanyCap());
		com.setManagerName(cjc.getManagerName());
		com.setCompanyAcc(cjc.getCompanyAcc());
		com.setCompanyBank(request.getParameter("companyBank"));
		com.setCompanyStatus("미승인");
		sessionRepository.insertCompany(com);
		path = "LEEview/mainForm";
		return path;
	}

}
