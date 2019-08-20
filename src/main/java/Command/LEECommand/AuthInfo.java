package Command.LEECommand;

public class AuthInfo {
	private String id;
	private String email;
	private String name;
	private String profile;
	private String memNum;
	private String comNum;
	private String comAcc;
	private String comBank;

	public AuthInfo() {
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

	public String getComNum() {
		return comNum;
	}

	public void setComNum(String comNum) {
		this.comNum = comNum;
	}

	public String getComAcc() {
		return comAcc;
	}

	public void setComAcc(String comAcc) {
		this.comAcc = comAcc;
	}

	public String getComBank() {
		return comBank;
	}

	public void setComBank(String comBank) {
		this.comBank = comBank;
	}

	public AuthInfo(String id, String email, String name) {
		this.id = id;
		this.email = email;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
