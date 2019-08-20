package Command.kimCommand;

public class GuestPayCommand {
	private String payStyle;
	private String payCardName;
	private Integer payCardNum;
	private Integer payCvcNum;
	private String payDate;
	
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
