package Command.kimCommand;

import java.sql.Clob;
import java.sql.Timestamp;

public class KendoJoinCommand {

	private String joinKakaoId;
	private String joinIntroduce;
	private Integer joinQty;
	
	private String friendName;
	private String friendPh;
	private Integer friendAge;
	
	
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
	public String getFriendPh() {
		return friendPh;
	}
	public void setFriendPh(String friendPh) {
		this.friendPh = friendPh;
	}
	public Integer getFriendAge() {
		return friendAge;
	}
	public void setFriendAge(Integer friendAge) {
		this.friendAge = friendAge;
	}
	
	
	
	
	
	
	
	
	
	
}
