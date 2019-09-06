package Model.DTO.YYYDTO;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class DodoY implements Serializable {
	private String doNum;
	private String goodsNum;
	private String goodsName;
	private String doName;
	private String memName;
	private String memNum;
	private String companyNum;
	
	private String hostNum;
	private Timestamp startDate;
	private Timestamp endDate;
	private Timestamp openDate;
	private Timestamp closeDate;
	private Long doPP;
	private Long nowPP;
	private String doDetail;
	private String optGender;
	private String optAge;
	private String status;
	private Long memPh;
	private String profile;
	private String doImg;
	private Long payTotal;
	private Timestamp dutchDate;
	private String payStyle;
	private Long cardNum;
	
	
	
	
	public String getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}

	public String getCompanyNum() {
		return companyNum;
	}

	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Long getCardNum() {
		return cardNum;
	}

	public void setCardNum(Long cardNum) {
		this.cardNum = cardNum;
	}

	public Timestamp getDutchDate() {
		return dutchDate;
	}

	public void setDutchDate(Timestamp dutchDate) {
		this.dutchDate = dutchDate;
	}

	public String getPayStyle() {
		return payStyle;
	}

	public void setPayStyle(String payStyle) {
		this.payStyle = payStyle;
	}

	public Long getPayTotal() {
		return payTotal;
	}

	public void setPayTotal(Long payTotal) {
		this.payTotal = payTotal;
	}

	public String getDoImg() {
		return doImg;
	}

	public void setDoImg(String doImg) {
		this.doImg = doImg;
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public Long getMemPh() {
		return memPh;
	}

	public void setMemPh(Long memPh) {
		this.memPh = memPh;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
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

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public Timestamp getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Timestamp openDate) {
		this.openDate = openDate;
	}

	public Timestamp getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(Timestamp closeDate) {
		this.closeDate = closeDate;
	}

	public Long getDoPP() {
		return doPP;
	}

	public void setDoPP(Long doPP) {
		this.doPP = doPP;
	}

	public Long getNowPP() {
		return nowPP;
	}

	public void setNowPP(Long nowPP) {
		this.nowPP = nowPP;
	}

	public String getDoDetail() {
		return doDetail;
	}

	public void setDoDetail(String doDetail) {
		this.doDetail = doDetail;
	}

	public String getOptGender() {
		return optGender;
	}

	public void setOptGender(String optGender) {
		this.optGender = optGender;
	}

	public String getOptAge() {
		return optAge;
	}

	public void setOptAge(String optAge) {
		this.optAge = optAge;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
