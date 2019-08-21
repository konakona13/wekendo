package Command.kimCommand;

import java.io.Serializable;
import java.sql.Clob;

import java.sql.Timestamp;
@SuppressWarnings("serial")
public class KendoJoinCommand implements Serializable{

	private String joinKakaoId;
	private String joinIntroduce;
	private Integer joinQty;
	
	private String friendName;
	private Integer friendPh;
	private Integer friendAge;
	
	private String doNum;

	
	public String getDoNum() {
		return doNum;
	}
	public void setDoNum(String doNum) {
		this.doNum = doNum;
	}
	
	public String getJoinKakaoId() {
		return joinKakaoId;
	}
	public void setJoinKakaoId(String joinKakaoId) {
		this.joinKakaoId = joinKakaoId;
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
