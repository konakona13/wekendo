package Command.kimCommand;

import java.io.Serializable;

@SuppressWarnings("serial")
public class SendLetterCommand implements Serializable{
	private String letterSender;
	private String letterReceiver;
	private String letterContent;
	public String getLetterSender() {
		return letterSender;
	}
	public void setLetterSender(String letterSender) {
		this.letterSender = letterSender;
	}
	public String getLetterReceiver() {
		return letterReceiver;
	}
	public void setLetterReceiver(String letterReceiver) {
		this.letterReceiver = letterReceiver;
	}
	public String getLetterContent() {
		return letterContent;
	}
	public void setLetterContent(String letterContent) {
		this.letterContent = letterContent;
	}
	
	
	
	
}
