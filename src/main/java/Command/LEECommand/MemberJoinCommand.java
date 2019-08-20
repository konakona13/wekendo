package Command.LEECommand;

public class MemberJoinCommand {
	private String id1;
	private String pw;
	private String pw1;
	private String userName;
	private String userBir;
	private String userGender;
	private String userEmail;
	private String userAddr;
	private String userPh1;

	public String getId1() {
		return id1;
	}

	public void setId1(String id1) {
		this.id1 = id1;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPw1() {
		return pw1;
	}

	public void setPw1(String pw1) {
		this.pw1 = pw1;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBir() {
		return userBir;
	}

	public void setUserBir(String userBir) {
		this.userBir = userBir;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getUserPh1() {
		return userPh1;
	}

	public void setUserPh1(String userPh1) {
		this.userPh1 = userPh1;
	}

	public boolean isPwEqualToPw1() {
		return pw.equals(pw1);
	}
}
