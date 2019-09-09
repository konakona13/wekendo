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
	private Long memPh1;
	private String addr;
	private String comBN;
	private String comCap;
	private String comManager;

	public String getComBN() {
		return comBN;
	}

	public void setComBN(String comBN) {
		this.comBN = comBN;
	}

	public String getComCap() {
		return comCap;
	}

	public void setComCap(String comCap) {
		this.comCap = comCap;
	}

	public String getComManager() {
		return comManager;
	}

	public void setComManager(String comManager) {
		this.comManager = comManager;
	}

	public Long getMemPh1() {
		return memPh1;
	}

	public void setMemPh1(Long memPh1) {
		this.memPh1 = memPh1;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

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
