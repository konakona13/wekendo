package Controller.kimController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Command.kimCommand.GuestPayCommand;
import Command.kimCommand.KendoJoinCommand;
import Service.kimService.KendoJoinService;

@Controller
public class KendoJoinController {
	String path = "";
	@Autowired
	private KendoJoinService kendoJoinService;
	
	
	@RequestMapping("/kendoJoin")
	public String kendoJoin(Model model) {
		path = "kimView/kendoJoin";
		return path;
	}
	
	@RequestMapping(value = "/guestPay", method = RequestMethod.POST)
	public String kendoJoinAction(HttpServletRequest request, Model model,KendoJoinCommand kendoJoinCommand) {
		path = kendoJoinService.addKendoJoin(model, kendoJoinCommand);
		return path;		
	}
	
	/*
	@RequestMapping("/guestPay")
	public String guestPay(Model model) {
		path = "kimView/kendoPayment";
		return path;
	}
*/
	@RequestMapping(value ="/guestPayAction", method = RequestMethod.POST)
	public String guestPay(Model model,KendoJoinCommand kendoJoinCommand, GuestPayCommand guestPayCommand) {
		path = kendoJoinService.guestPay(model,kendoJoinCommand,guestPayCommand);
		
		return path;
	}
}
