package Model.DTO.kimDTO;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class Letter implements Serializable{
	private String letterNum;
	private String memberNum;
	private String companyNum;
	private Timestamp letterDate;
	private String letterSender;
	private String letterReceiver;
	private String letterContent;
	
	public String getLetterNum() {
		return letterNum;
	}
	public void setLetterNum(String letterNum) {
		this.letterNum = letterNum;
	}
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public String getCompanyNum() {
		return companyNum;
	}
	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}
	public Timestamp getLetterDate() {
		return letterDate;
	}
	public void setLetterDate(Timestamp letterDate) {
		this.letterDate = letterDate;
	}
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
