package Service.kimService;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Command.kimCommand.SendLetterCommand;
import Model.DTO.kimDTO.Letter;
import Repository.kimRepository.LetterRepository;

@Service
public class LetterService {
	private Timestamp tst;
	
	@Autowired
	private Letter letter;
	
	@Autowired
	private LetterRepository letterRepository;
	
	
	public void sendLetter(Model model, SendLetterCommand slc) {
		model.addAttribute(slc);
		
		tst = new Timestamp(new Date().getTime());
		letter.setLetterDate(tst);
		letter.setLetterSender(slc.getLetterSender());
		letter.setLetterReceiver(slc.getLetterReceiver());
		letter.setLetterContent(slc.getLetterContent());
		
		System.out.println(letter.getLetterDate());
		System.out.println(letter.getLetterSender());
		System.out.println(letter.getLetterReceiver());
		System.out.println(letter.getLetterContent());
		

		letterRepository.sendLetter(letter);	
	}

	public String sendBoxList(Model model) {
		String path = "";
		
		List<Letter> list = letterRepository.getSendBoxList();
		
		System.out.println("letters.size : "+ list.size());
		
		model.addAttribute("letters",list);
		
		return "kimView/sendBoxList" ;

	}

	public String receiveBoxList(Model model) {
		String path = "";
		
		List<Letter> list = letterRepository.getReceiveBoxList();
		
		System.out.println("receiveBox.size : "+ list.size());
		
		model.addAttribute("receiveBox",list);
		
		return "kimView/receiveBoxList" ;
	}
}
