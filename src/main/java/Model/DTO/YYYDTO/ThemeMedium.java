package Model.DTO.YYYDTO;

import java.io.Serializable;

public class ThemeMedium implements Serializable {
		
	String themeLNum;
	String themeMNum;
	String themeMName;
	
	
	public String getThemeLNum() {
		return themeLNum;
	}
	public void setThemeLNum(String themeLNum) {
		this.themeLNum = themeLNum;
	}
	public String getThemeMNum() {
		return themeMNum;
	}
	public void setThemeMNum(String themeMNum) {
		this.themeMNum = themeMNum;
	}
	public String getThemeMName() {
		return themeMName;
	}
	public void setThemeMName(String themeMName) {
		this.themeMName = themeMName;
	}

	
}
