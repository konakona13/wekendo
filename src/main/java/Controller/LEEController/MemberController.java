package Controller.LEEController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Command.LEECommand.CompanyJoinCommand;
import Command.LEECommand.LoginCommand;
import Command.LEECommand.MemberJoinCommand;
import Service.LEEService.CompanyJoinService;
import Service.LEEService.MemberJoinService;
import Service.LEEService.MemberLoginService;
import Service.LEEService.MemberLogoutService;
import Validator.LoginCommandValidator;
import Validator.RegisterRequestValidator;

@Controller
public class MemberController {

	@Autowired
	private MemberJoinService memberJoinService;
	@Autowired
	private CompanyJoinService companyJoinService;
	@Autowired
	private MemberLoginService memberLoginService;
	@Autowired
	private MemberLogoutService memberLogoutService;

	@RequestMapping("/loginmain")
	public String mainView() {
		return "LEEview/mainForm";
	}

	@RequestMapping("/memberJoin")
	public String joinMember(Model model) {
		model.addAttribute("memberJoinCommand", new MemberJoinCommand());
		return "LEEview/memberForm";
	}
	
	@RequestMapping("/companyJoin")
	public String joinCompany(Model model) {
		model.addAttribute("companyJoinCommand", new CompanyJoinCommand());
		return "LEEview/companyForm";
	}

	@RequestMapping(value = "/MemberJoinAction", method = RequestMethod.POST)
	public String memberJoinAction(Model model, MemberJoinCommand memberJoinCommand, Errors errors,
			@RequestParam("id1") String memId, @RequestParam("profile") MultipartFile report,
			HttpServletRequest request, HttpSession session) {
		String path = "";
		new RegisterRequestValidator().validate(memberJoinCommand, errors);
		if (errors.hasErrors()) {
			return "LEEview/memberForm";
		}
		try {
			path = memberJoinService.memberInsert(model, memberJoinCommand, memId, report, request, session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return path;
	}
	
	@RequestMapping(value = "/CompanyJoinAction", method = RequestMethod.POST)
	public String companyJoinAction(Model model, CompanyJoinCommand companyJoinCommand, Errors errors,
			@RequestParam("id1") String comId, HttpServletRequest request, HttpSession session) {
		String path = "";
		/*
		new RegisterRequestValidator().validate(companyJoinCommand, errors);
		if (errors.hasErrors()) {
			return "LEEview/memberForm";
		}
		*/
		try {
			path = companyJoinService.comInsert(model, companyJoinCommand, comId, request, session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return path;
	}

	@RequestMapping("loginPro")
	public String loginPro(Model model, LoginCommand loginCommand, HttpSession session, HttpServletResponse response,
			Errors errors) {
		new LoginCommandValidator().validate(loginCommand, errors);
		if (errors.hasErrors())
			return "redirect:index.html"; // 수정
		String path = memberLoginService.loginPro(model, loginCommand, session, response);
		return path;
	}

	@RequestMapping("Logout")
	public String logout(HttpSession session, HttpServletResponse response) {
		memberLogoutService.logout(session, response);
		return "redirect:loginmain";
	}

	@RequestMapping("/confirmId")
	public String confirmId(@RequestParam(value = "id1") String id1, Model model) {

		return "LEEview/confirmId";
	}
}
