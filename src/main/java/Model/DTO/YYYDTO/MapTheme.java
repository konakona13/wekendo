package Model.DTO.YYYDTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MapTheme implements Serializable {
	
	String goodsNum;
	String mapLNum;
	String mapLName;
	String mapMNum;
	String mapMName;
	String mapSNum;
	String mapSName;
	
	String themeLNum;
	String themeLName;
	String themeMNum;
	String themeMName;
	String themeSNum;
	String themeSName;
	
	@Override
    public String toString() {
        return "MapTheme [지역대분류=" + mapLName + ", 지역중분류=" + mapMName + ", 지역소분류=" + mapSName + ", 테마대분류=" + themeLName + "]";
    }
	
	
	public String getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getMapLNum() {
		return mapLNum;
	}
	public void setMapLNum(String mapLNum) {
		this.mapLNum = mapLNum;
	}
	public String getMapLName() {
		return mapLName;
	}
	public void setMapLName(String mapLName) {
		this.mapLName = mapLName;
	}
	public String getMapMNum() {
		return mapMNum;
	}
	public void setMapMNum(String mapMNum) {
		this.mapMNum = mapMNum;
	}
	public String getMapMName() {
		return mapMName;
	}
	public void setMapMName(String mapMName) {
		this.mapMName = mapMName;
	}
	public String getMapSNum() {
		return mapSNum;
	}
	public void setMapSNum(String mapSNum) {
		this.mapSNum = mapSNum;
	}
	public String getMapSName() {
		return mapSName;
	}
	public void setMapSName(String mapSName) {
		this.mapSName = mapSName;
	}
	public String getThemeLNum() {
		return themeLNum;
	}
	public void setThemeLNum(String themeLNum) {
		this.themeLNum = themeLNum;
	}
	public String getThemeLName() {
		return themeLName;
	}
	public void setThemeLName(String themeLName) {
		this.themeLName = themeLName;
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
	public String getThemeSNum() {
		return themeSNum;
	}
	public void setThemeSNum(String themeSNum) {
		this.themeSNum = themeSNum;
	}
	public String getThemeSName() {
		return themeSName;
	}
	public void setThemeSName(String themeSName) {
		this.themeSName = themeSName;
	}
	
	
	
}
