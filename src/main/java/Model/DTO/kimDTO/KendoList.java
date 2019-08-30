package Model.DTO.kimDTO;

import java.io.Serializable;
import java.sql.Timestamp;

import Model.DTO.HHHDTO.DoIMG;

@SuppressWarnings("serial")
public class KendoList implements Serializable{

	
	
	private String doNum;
	private String hostNum;
	//private String hostId;
	private String doName;
	private Timestamp doStartDate;
	private Timestamp doEndDate;
	private Timestamp doOpenDate;
	private Timestamp doCloseDate;
	private Integer doPp;
	private Integer doNowPp;
	private String doDetail;
	private String doOptGender;
	private String doOptAge;
	private String doStatus;
	
	private PaymentKim paymentKim;
	private DoIMG doImg;
	
		
	public DoIMG getDoImg() {
		return doImg;
	}

	public void setDoImg(DoIMG doImg) {
		this.doImg = doImg;
	}

	public PaymentKim getPaymentKim() {
		return paymentKim;
	}
	
	public void setPaymentKim(PaymentKim paymentKim) {
		this.paymentKim = paymentKim;
	}

	public String getDoNum() {
		return doNum;
	}
	public void setDoNum(String doNum) {
		this.doNum = doNum;
	}
	public String getHostNum() {
		return hostNum;
	}
	public void setHostNum(String hostNum) {
		this.hostNum = hostNum;
	}
	public String getDoName() {
		return doName;
	}
	public void setDoName(String doName) {
		this.doName = doName;
	}
	public Timestamp getDoStartDate() {
		return doStartDate;
	}
	public void setDoStartDate(Timestamp doStartDate) {
		this.doStartDate = doStartDate;
	}
	public Timestamp getDoEndDate() {
		return doEndDate;
	}
	public void setDoEndDate(Timestamp doEndDate) {
		this.doEndDate = doEndDate;
	}
	public Timestamp getDoOpenDate() {
		return doOpenDate;
	}
	public void setDoOpenDate(Timestamp doOpenDate) {
		this.doOpenDate = doOpenDate;
	}
	public Timestamp getDoCloseDate() {
		return doCloseDate;
	}
	public void setDoCloseDate(Timestamp doCloseDate) {
		this.doCloseDate = doCloseDate;
	}
	public Integer getDoPp() {
		return doPp;
	}
	public void setDoPp(Integer doPp) {
		this.doPp = doPp;
	}
	public Integer getDoNowPp() {
		return doNowPp;
	}
	public void setDoNowPp(Integer doNowPp) {
		this.doNowPp = doNowPp;
	}
	public String getDoDetail() {
		return doDetail;
	}
	public void setDoDetail(String doDetail) {
		this.doDetail = doDetail;
	}
	public String getDoOptGender() {
		return doOptGender;
	}
	public void setDoOptGender(String doOptGender) {
		this.doOptGender = doOptGender;
	}
	public String getDoOptAge() {
		return doOptAge;
	}
	public void setDoOptAge(String doOptAge) {
		this.doOptAge = doOptAge;
	}
	public String getDoStatus() {
		return doStatus;
	}
	public void setDoStatus(String doStatus) {
		this.doStatus = doStatus;
	}


	

	

	
	
	
}
