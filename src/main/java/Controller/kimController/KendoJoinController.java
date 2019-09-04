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
import Service.LEEService.UpdateDoStatusService;
import Service.kimService.KendoJoinService;

@Controller
public class KendoJoinController {
	String path = "";
	@Autowired
	private KendoJoinService kendoJoinService;
	@Autowired
	private UpdateDoStatusService updateDoStatusService;
	
	
	@RequestMapping("/main")
	public String memberMain(Model model) {
		updateDoStatusService.updateStatus(model);
		path = "memberMain";
		return path;
	}
	
	
	@RequestMapping("/comMain")
	public String comMain(Model model) {
		updateDoStatusService.updateStatus(model);
		path = "companyMain";
		return path;
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
		System.out.println("켄두조인jsp 두넘:"+kendoDetailCommand.getDoNum());
		System.out.println("켄두조인jsp 호스트넘:"+kendoDetailCommand.getHostNum());

		return path;
	}
	
	@RequestMapping("/kendoDetail/kendoJoinAction")
	public String kendoJoinAction(Model model,KendoJoinCommand kendoJoinCommand, KendoDetailCommand kendoDetailCommand) {
		path = kendoJoinService.addKendoJoin(model, kendoJoinCommand, kendoDetailCommand);
		return path;		
	}
	
	@RequestMapping("/kendoDetail/guestPayAction")
	public String guestPayAction(Model model,GuestPayCommand guestPayCommand, KendoJoinCommand kendoJoinCommand,KendoDetailCommand kendoDetailCommand, HttpSession session) {
		System.out.println("guestPayDetail11111");
		path = kendoJoinService.guestPayDetail(model, guestPayCommand, kendoJoinCommand,kendoDetailCommand,session);
		return path;		
	}
	
	@RequestMapping("/kendoJoinList")
	public String kendoJoinList(Model model) {

		return kendoJoinService.kendoJoinList(model);
	
	}
	
	@RequestMapping("/kendoDetail/{num}")
	public String kendoDetail(@PathVariable("num") String doNum, Model model,HttpSession session) {

		return kendoJoinService.kendoDetail(doNum, model,session);
	}

}
