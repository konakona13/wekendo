package Model.DTO.kimDTO;

import java.sql.Timestamp;

public class GuestPay {
	private String payNum;
	private String doNum;
	private String guestNum;
	private String hostNum;
	private String joinNum;
	private Timestamp dutchDate;
	private String dutchStatus;
	private String payStyle;
	private String payCardName;
	private Integer payCardNum;
	private Integer payCvcNum;
	private String payDate;
	
	
	public String getPayNum() {
		return payNum;
	}
	public void setPayNum(String payNum) {
		this.payNum = payNum;
	}
	public String getDoNum() {
		return doNum;
	}
	public void setDoNum(String doNum) {
		this.doNum = doNum;
	}
	public String getGuestNum() {
		return guestNum;
	}
	public void setGuestNum(String guestNum) {
		this.guestNum = guestNum;
	}
	public String getHostNum() {
		return hostNum;
	}
	public void setHostNum(String hostNum) {
		this.hostNum = hostNum;
	}
	public String getJoinNum() {
		return joinNum;
	}
	public void setJoinNum(String joinNum) {
		this.joinNum = joinNum;
	}
	public Timestamp getDutchDate() {
		return dutchDate;
	}
	public void setDutchDate(Timestamp dutchDate) {
		this.dutchDate = dutchDate;
	}
	public String getDutchStatus() {
		return dutchStatus;
	}
	public void setDutchStatus(String dutchStatus) {
		this.dutchStatus = dutchStatus;
	}
	public String getPayStyle() {
		return payStyle;
	}
	public void setPayStyle(String payStyle) {
		this.payStyle = payStyle;
	}
	public String getPayCardName() {
		return payCardName;
	}
	public void setPayCardName(String payCardName) {
		this.payCardName = payCardName;
	}
	public Integer getPayCardNum() {
		return payCardNum;
	}
	public void setPayCardNum(Integer payCardNum) {
		this.payCardNum = payCardNum;
	}
	public Integer getPayCvcNum() {
		return payCvcNum;
	}
	public void setPayCvcNum(Integer payCvcNum) {
		this.payCvcNum = payCvcNum;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	
	
	

}
