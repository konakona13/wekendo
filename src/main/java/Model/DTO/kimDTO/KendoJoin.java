package Model.DTO.kimDTO;

import java.sql.Clob;
import java.sql.Timestamp;

import oracle.sql.CLOB;
import oracle.sql.TIMESTAMP;

public class KendoJoin {
	private String joinNum;
	private String doNum;
	private String guestNum;	
	private String hostNum;
	private Timestamp joinDate;
	private String joinKakaoid;
	private String joinIntroduce;
	private Integer joinQty;
	
	
	public String getJoinNum() {
		return joinNum;
	}
	public void setJoinNum(String joinNum) {
		this.joinNum = joinNum;
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
	
	
	

	
	
	
}
