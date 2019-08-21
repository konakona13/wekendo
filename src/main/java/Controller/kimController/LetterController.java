package Controller.kimController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Command.kimCommand.SendLetterCommand;
import Service.kimService.LetterService;

@Controller
public class LetterController {
	String path = "";
	
	@Autowired
	private LetterService letterService;
	
	@RequestMapping("/sendLetter")
	public String kendoJoin(Model model) {
		path = "kimView/sendLetter";
		return path;
	}
	
	@RequestMapping("/sendLetterAction")
	public String kendoJoin(Model model, SendLetterCommand sendLetterCommand ) {
		
		letterService.sendLetter(model,sendLetterCommand);
		path = "kimView/kim";
		return path;
	}
	
	@RequestMapping("/sendBoxList")
	public String sendBoxList(Model model) {
		return letterService.sendBoxList(model);

	}
	
	@RequestMapping("/receiveBoxList")
	public String receiveBoxList(Model model) {
		return letterService.receiveBoxList(model);

	}
	

}
