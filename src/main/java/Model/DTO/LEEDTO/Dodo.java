package Model.DTO.LEEDTO;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class Dodo implements Serializable {
	private String doNum;
	private String hostNum;
	private String doName;
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
	private String memName;
	private Long memPh;
	private String profile;

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
