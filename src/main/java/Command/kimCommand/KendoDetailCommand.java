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
