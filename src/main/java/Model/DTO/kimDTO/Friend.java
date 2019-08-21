package Model.DTO.kimDTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Friend implements Serializable {
	private String joinNum;
	private String doNum;
	private String guestNum;	
	private String hostNum;
	private String  friendName;
	private Integer friendPh;
	private Integer friendAge;
	
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
	public String getFriendName() {
		return friendName;
	}
	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}
	public Integer getFriendPh() {
		return friendPh;
	}
	public void setFriendPh(Integer friendPh) {
		this.friendPh = friendPh;
	}
	public Integer getFriendAge() {
		return friendAge;
	}
	public void setFriendAge(Integer friendAge) {
		this.friendAge = friendAge;
	}
	
	
}
