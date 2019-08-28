package Model.DTO.kimDTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class PaymentKim implements Serializable{
	private String payNum;
	private Integer payPp;
	private Integer payDutch;
	private Integer payTotalPrice;
	
	public String getPayNum() {
		return payNum;
	}
	public void setPayNum(String payNum) {
		this.payNum = payNum;
	}
	public Integer getPayPp() {
		return payPp;
	}
	public void setPayPp(Integer payPp) {
		this.payPp = payPp;
	}
	public Integer getPayDutch() {
		return payDutch;
	}
	public void setPayDutch(Integer payDutch) {
		this.payDutch = payDutch;
	}
	public Integer getPayTotalPrice() {
		return payTotalPrice;
	}
	public void setPayTotalPrice(Integer payTotalPrice) {
		this.payTotalPrice = payTotalPrice;
	}
	
}
