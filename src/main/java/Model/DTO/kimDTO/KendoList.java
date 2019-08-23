package Model.DTO.kimDTO;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class KendoList implements Serializable{
	private String joinNum;
	
	private String guestNum;
	private String guestId;
	
	
	private String doNum;
	private String hostNum;
	private String hostId;
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
	
	private Timestamp joinDate;
	private String joinKakaoid;
	private String joinIntroduce;
	private Integer joinQty;
	private Integer joinPrice;
	
	public String getJoinNum() {
		return joinNum;
	}
	public void setJoinNum(String joinNum) {
		this.joinNum = joinNum;
	}
	public String getGuestNum() {
		return guestNum;
	}
	public void setGuestNum(String guestNum) {
		this.guestNum = guestNum;
	}
	public String getGuestId() {
		return guestId;
	}
	public void setGuestId(String guestId) {
		this.guestId = guestId;
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
	public String getHostId() {
		return hostId;
	}
	public void setHostId(String hostId) {
		this.hostId = hostId;
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
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	public String getJoinKakaoid() {
		return joinKakaoid;
	}
	public void setJoinKakaoid(String joinKakaoid) {
		this.joinKakaoid = joinKakaoid;
	}
	public String getJoinIntroduce() {
		return joinIntroduce;
	}
	public void setJoinIntroduce(String joinIntroduce) {
		this.joinIntroduce = joinIntroduce;
	}
	public Integer getJoinQty() {
		return joinQty;
	}
	public void setJoinQty(Integer joinQty) {
		this.joinQty = joinQty;
	}
	public Integer getJoinPrice() {
		return joinPrice;
	}
	public void setJoinPrice(Integer joinPrice) {
		this.joinPrice = joinPrice;
	}
	

	

	
	
	
}
