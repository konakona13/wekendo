package Service.LEEService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.LEECommand.AuthInfo;
import Command.LEECommand.LoginCommand;
import Model.DTO.LEEDTO.Company;
import Repository.LEERepository.SessionRepository;

@Service
public class CompanyLoginService {

	@Autowired
	private SessionRepository sessionRepository;

	public String loginPro(Model model, LoginCommand loginCommand, HttpSession session, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Company company = sessionRepository.comCheck(loginCommand.getId1(), loginCommand.getPw());
		if (company == null) {
			model.addAttribute("msg111", "아이디가 존재하지 않습니다.");
		} else {
			AuthInfo authInfo = new AuthInfo(company.getCompanyId(), company.getManagerEmail(),
					company.getCompanyName());
			authInfo.setComNum(company.getCompanyNum());
			authInfo.setComAcc(company.getCompanyAcc());
			authInfo.setComBank(company.getCompanyBank());
			authInfo.setAddr(company.getCompanyAddr());
			authInfo.setMemPh1(company.getCompanyPh());
			authInfo.setComCap(company.getCompanyCap());
			authInfo.setComManager(company.getManagerName());
			authInfo.setComBN(company.getCompanyBn());
			session.setAttribute("comAuth", authInfo);
			session.setAttribute("comNum", company.getCompanyNum());
			session.setAttribute("admin", company.getCompanyId());
		}
		String idStore = loginCommand.getIdStore();
		setCookie(idStore, response, loginCommand);
		if (company.getCompanyId().equals("admin")) {
			return "redirect:adminMain";
		}
		return "redirect:comMain";
	}

	public void setCookie(String idStore, HttpServletResponse response, LoginCommand loginCommand) {
		if (idStore != null && idStore.equals("store")) {
			Cookie cookie = new Cookie("id", loginCommand.getId1());
			cookie.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(cookie);
		} else { // idstore의 체크하지 않았다면 쿠키 삭제
			Cookie cookie = new Cookie("id", loginCommand.getId1());
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		String autoLogin = loginCommand.getAutoLogin();
		if (autoLogin.equals("auto")) {
			Cookie autoCk = new Cookie("auto", loginCommand.getId1());
			autoCk.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(autoCk);
		}
	}
}
