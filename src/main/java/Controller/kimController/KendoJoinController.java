package Controller.kimController;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Command.kimCommand.GuestPayCommand;
import Command.kimCommand.KendoDetailCommand;
import Command.kimCommand.KendoJoinCommand;
import Model.DTO.LEEDTO.Member;
import Service.LEEService.CompanyOrderService;
import Service.LEEService.UpdateDoStatusService;
import Service.kimService.KendoJoinService;

@Controller
public class KendoJoinController {
	String path = "";
	@Autowired
	private KendoJoinService kendoJoinService;
	@Autowired
	private UpdateDoStatusService updateDoStatusService;

	@Autowired
	private CompanyOrderService companyOrderService;
	
	@RequestMapping("/main")
	public String memberMain(Model model) {
		updateDoStatusService.updateStatus(model);
		return kendoJoinService.kendoJoinListMain(model);

	}
	
	/*
	@RequestMapping("/comMain")
	public String comMain(Model model) {
		updateDoStatusService.updateStatus(model);
		path = "companyMain";
		return path;
	}
	*/
	@RequestMapping("/comMain")
	public String getOrder(HttpSession session, Model model) {
		updateDoStatusService.updateStatus(model);
		companyOrderService.getOrder(session, model);
		return "kimView/companyMain2";
	}
	
	
	
	@RequestMapping("/adminMain")
	public String adminMain(Model model) {
		updateDoStatusService.updateStatus(model);
		path = "adminMain";
		return path;
	}
	
	
	
	@RequestMapping("/kim")
	public String kim() {
		path = "kimView/kim";
		return path;
	}
	

	
	@RequestMapping("/kendoDetail/kendoJoin")
	public String kendoJoin(Model model,KendoDetailCommand kendoDetailCommand,HttpSession session) {

		path = kendoJoinService.userInfo(model,session);

		model.addAttribute("kdc",kendoDetailCommand);

		return path;
	}
	
	@RequestMapping("/kendoDetail/kendoJoinAction")
	public String kendoJoinAction(Model model,KendoJoinCommand kendoJoinCommand, KendoDetailCommand kendoDetailCommand) {
		path = kendoJoinService.addKendoJoin(model, kendoJoinCommand, kendoDetailCommand);
		return path;		
	}
	
	@RequestMapping("/kendoDetail/guestPayAction")
	public String guestPayAction(Model model,GuestPayCommand guestPayCommand, KendoJoinCommand kendoJoinCommand,KendoDetailCommand kendoDetailCommand, HttpSession session) {
		//System.out.println("guestPayDetail11111");
		path = kendoJoinService.guestPayDetail(model, guestPayCommand, kendoJoinCommand,kendoDetailCommand,session);
		return path;		
	}
	
	@RequestMapping("/kendoJoinList")
	public String kendoJoinList(Model model) {

		return kendoJoinService.kendoJoinList(model);
	
	}
	
	
	@RequestMapping("/memberMain2")
	public String kendoJoinListMain(Model model) {
		return kendoJoinService.kendoJoinListMain(model);
	
	}
	
	
	
	@RequestMapping("/kendoDetail/{num}")
	public String kendoDetail(@PathVariable("num") String doNum, Model model,HttpSession session) {

		return kendoJoinService.kendoDetail(doNum, model,session);
	}
	
	
	
	
	
	

}
