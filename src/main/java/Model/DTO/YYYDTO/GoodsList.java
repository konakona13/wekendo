package Model.DTO.YYYDTO;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class GoodsList implements Serializable {
	
	private String companyNum; //기업번호
	private String companyKind; //기업구분
	private String companyName;
	private String companyStatus; //가입승인상태
	
	private String goodsNum;
	private Timestamp regDate;
	private String goodsName;
	private String goodsStatus;
	
	
	@Override
    public String toString() {
        return "GoodsList [회사번호=" + companyNum + ", 회사이름=" + companyName + ", 회사가입=" + companyStatus + ", 상품명=" + goodsName + "]";
    }
	
	
	public String getCompanyNum() {
		return companyNum;
	}
	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}
	public String getCompanyKind() {
		return companyKind;
	}
	public void setCompanyKind(String companyKind) {
		this.companyKind = companyKind;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}
	

	public String getCompanyStatus() {
		return companyStatus;
	}
	public void setCompanyStatus(String companyStatus) {
		this.companyStatus = companyStatus;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsStatus() {
		return goodsStatus;
	}
	public void setGoodsStatus(String goodsStatus) {
		this.goodsStatus = goodsStatus;
	}


}
