package Model.DTO.LEEDTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Company implements Serializable{
	private String companyId;
	private String companyPw;
	private String companyNum;
	private String companyKind;
	private String companyBn;
	private String companyName;
	private String companyCap;
	private String managerEmail;
	private String managerName;
	private String companyAddr;
	private Long companyPh;
	private String companyAcc;
	private String companyBank;
	private String companyStatus;

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCompanyPw() {
		return companyPw;
	}

	public void setCompanyPw(String companyPw) {
		this.companyPw = companyPw;
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

	public String getCompanyBn() {
		return companyBn;
	}

	public void setCompanyBn(String companyBn) {
		this.companyBn = companyBn;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyCap() {
		return companyCap;
	}

	public void setCompanyCap(String companyCap) {
		this.companyCap = companyCap;
	}

	public String getManagerEmail() {
		return managerEmail;
	}

	public void setManagerEmail(String managerEmail) {
		this.managerEmail = managerEmail;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getCompanyAddr() {
		return companyAddr;
	}

	public void setCompanyAddr(String companyAddr) {
		this.companyAddr = companyAddr;
	}

	public Long getCompanyPh() {
		return companyPh;
	}

	public void setCompanyPh(Long companyPh) {
		this.companyPh = companyPh;
	}

	public String getCompanyAcc() {
		return companyAcc;
	}

	public void setCompanyAcc(String companyAcc) {
		this.companyAcc = companyAcc;
	}

	public String getCompanyBank() {
		return companyBank;
	}

	public void setCompanyBank(String companyBank) {
		this.companyBank = companyBank;
	}

	public String getCompanyStatus() {
		return companyStatus;
	}

	public void setCompanyStatus(String companyStatus) {
		this.companyStatus = companyStatus;
	}
}
