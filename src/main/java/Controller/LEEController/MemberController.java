package Controller.LEEController;

import java.util.List;

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
import Model.DTO.LEEDTO.Dodo;
import Model.DTO.YYYDTO.GoodsList;
import Repository.YYYRepository.GoodsRepository;
import Service.LEEService.CompanyCashService;
import Service.LEEService.CompanyJoinService;
import Service.LEEService.CompanyLoginService;
import Service.LEEService.MemKendoService;
import Service.LEEService.MemberJoinService;
import Service.LEEService.MemberLoginService;
import Service.LEEService.MemberLogoutService;
import Service.LEEService.UpdateDoStatusService;
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
	@Autowired
	private CompanyLoginService companyLoginService;
	@Autowired
	private CompanyCashService companyCashService;
	@Autowired
	private GoodsRepository goodsRepository;
	@Autowired
	private MemKendoService memKendoService;

	@RequestMapping("/loginmain")
	public String mainView(HttpServletRequest request, Model model) {
		// System.out.println(request.getRealPath("/WEB-INF/view/LEEview/upload"));
		// updateDoStatusService.updateStatus(model);
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
		 * new RegisterRequestValidator().validate(companyJoinCommand, errors); if
		 * (errors.hasErrors()) { return "LEEview/memberForm"; }
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
			Errors errors, @RequestParam("selectLogin") String selectLogin) {
		// updateDoStatusService.updateStatus(model);
		String path = "";
		if (selectLogin.equals("normal")) {
			new LoginCommandValidator().validate(loginCommand, errors);
			if (errors.hasErrors())
				return "redirect:index.jsp"; // 수정
			path = memberLoginService.loginPro(model, loginCommand, session, response);
		} else if (selectLogin.equals("company") || selectLogin.equals("admin")) {
			new LoginCommandValidator().validate(loginCommand, errors);
			if (errors.hasErrors())
				return "redirect:index.jsp"; // 수정
			path = companyLoginService.loginPro(model, loginCommand, session, response);
		}
		return path;
	}

	@RequestMapping("Logout1")
	public String logout(HttpSession session, HttpServletResponse response) {
		memberLogoutService.logout(session, response);
		return "redirect:main";
	}

	@RequestMapping("companyCash")
	public String companyCash(Model model, HttpSession session,
			@RequestParam(value = "page", defaultValue = "1") String page) {
		return companyCashService.cashAndBuyList(model, session, page);
	}

	@RequestMapping("goodsMainLEE")
	public String comGoods(Model model, @RequestParam(value = "comNum") String comNum) {
		List<GoodsList> list = goodsRepository.getGoodsList(comNum);
		model.addAttribute("list", list);
		return "YYYView/goodsMain";
	}

	@RequestMapping("kendoMainLEE")
	public String memKendos(Model model, @RequestParam(value = "memNum") String memNum) {
		List<Dodo> hostlist = memKendoService.getHostList(memNum);
		List<Dodo> guestlist = memKendoService.getGuestList(memNum);
		model.addAttribute("hostlists", hostlist);
		model.addAttribute("guestlists", guestlist);
		return "LEEview/memberPayList";
	}

	@RequestMapping("kakao")
	public String kakaotest(Model model, @RequestParam(value = "doName") String doName,
			@RequestParam(value = "sumPrice") int sumPrice, HttpServletRequest request) {
		model.addAttribute("doName", doName);
		model.addAttribute("sumPrice", sumPrice);
		request.setAttribute("doName1", doName);
		request.setAttribute("sumPrice1", sumPrice);
		return "LEEview/kakaopaytest";
	}

	@RequestMapping("memDoList")
	public String memKendos1(Model model, @RequestParam(value = "memNum") String memNum) {
		List<Dodo> hostlist = memKendoService.getHostList(memNum);
		List<Dodo> guestlist = memKendoService.getGuestList(memNum);
		model.addAttribute("hostlists", hostlist);
		model.addAttribute("guestlists", guestlist);
		return "LEEview/memberPayList";
	}

	@RequestMapping("confirmId")
	public String confirmId(@RequestParam(value = "id1") String id1, Model model) {
		memberLoginService.getSelectId(id1, model);
		return "LEEview/confirmId";
	}
}
