package Command.kimCommand;

import java.io.Serializable;

@SuppressWarnings("serial")
public class KendoDetailCommand implements Serializable{
	private String doNum;
	private String theme;
	private String map;
	private String doName;
	private Integer doQty;
	private Integer doPrice;
	private Integer doPp;
	private Integer doNowPp;
	private String hostNum;
	
	
	
	public String getHostNum() {
		return hostNum;
	}
	public void setHostNum(String hostNum) {
		this.hostNum = hostNum;
	}
	public Integer getDoNowPp() {
		return doNowPp;
	}
	public void setDoNowPp(Integer doNowPp) {
		this.doNowPp = doNowPp;
	}
	public Integer getDoPp() {
		return doPp;
	}
	public void setDoPp(Integer doPp) {
		this.doPp = doPp;
	}
	public String getDoNum() {
		return doNum;
	}
	public void setDoNum(String doNum) {
		this.doNum = doNum;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public String getDoName() {
		return doName;
	}
	public void setDoName(String doName) {
		this.doName = doName;
	}
	public Integer getDoQty() {
		return doQty;
	}
	public void setDoQty(Integer doQty) {
		this.doQty = doQty;
	}
	public Integer getDoPrice() {
		return doPrice;
	}
	public void setDoPrice(Integer doPrice) {
		this.doPrice = doPrice;
	}

	
}
