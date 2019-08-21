package Controller.kimController;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import Command.kimCommand.GuestPayCommand;
import Command.kimCommand.KendoDetailCommand;
import Command.kimCommand.KendoJoinCommand;
import Service.kimService.KendoJoinService;

@Controller
public class KendoJoinController {
	String path = "";
	@Autowired
	private KendoJoinService kendoJoinService;

	
	@RequestMapping("/kim")
	public String kim() {
		path = "kimView/kim";
		return path;
	}
	
	@RequestMapping("kendoDetail")
	public String kendoDetail(Model model) {
		path = "kimView/kendoDetail";
		return path;
	}
	
	
	@RequestMapping("/kendoJoin")
	public String kendoJoin(Model model,KendoDetailCommand kendoDetailCommand) {

		path = "kimView/kendoJoin";
		model.addAttribute("kdc",kendoDetailCommand);
		return path;
	}
	
	@RequestMapping("/kendoJoinAction")
	public String kendoJoinAction(Model model,KendoJoinCommand kendoJoinCommand, KendoDetailCommand kendoDetailCommand) {
		path = kendoJoinService.addKendoJoin(model, kendoJoinCommand, kendoDetailCommand);
		return path;		
	}
	
	@RequestMapping("/guestPayAction")
	public String guestPayAction(Model model,GuestPayCommand guestPayCommand, KendoJoinCommand kendoJoinCommand, HttpSession session) {
		System.out.println("guestPayDetail");
		path = kendoJoinService.guestPayDetail(model, guestPayCommand, kendoJoinCommand,session);
		return path;		
	}
	
	@RequestMapping("/kendoJoinList")
	public String kendoJoinList(Model model) {
		return kendoJoinService.kendoJoinList(model);
	
	}
}
