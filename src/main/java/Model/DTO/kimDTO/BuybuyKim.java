package Model.DTO.kimDTO;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class BuybuyKim implements Serializable{
	private String buyNum;
	private String doNum;
	private String payNum;
	private String hostNum;
	private String goodsNum;
	private String companyNum;
	private String mapLNum;
	private String mapMNum;
	private String mapSNum;
	private String themeLNum;
	private String themeMNum;
	private String themeSNum;
	private Integer buyQty;
	private Timestamp buyStartDate;
	private Timestamp buyEndDate;
	private Integer buyDays;
	private Integer buyPrice;
	
	public String getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(String buyNum) {
		this.buyNum = buyNum;
	}
	public String getDoNum() {
		return doNum;
	}
	public void setDoNum(String doNum) {
		this.doNum = doNum;
	}
	public String getPayNum() {
		return payNum;
	}
	public void setPayNum(String payNum) {
		this.payNum = payNum;
	}
	public String getHostNum() {
		return hostNum;
	}
	public void setHostNum(String hostNum) {
		this.hostNum = hostNum;
	}
	public String getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getCompanyNum() {
		return companyNum;
	}
	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}
	public String getMapLNum() {
		return mapLNum;
	}
	public void setMapLNum(String mapLNum) {
		this.mapLNum = mapLNum;
	}
	public String getMapMNum() {
		return mapMNum;
	}
	public void setMapMNum(String mapMNum) {
		this.mapMNum = mapMNum;
	}
	public String getMapSNum() {
		return mapSNum;
	}
	public void setMapSNum(String mapSNum) {
		this.mapSNum = mapSNum;
	}
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
	public String getThemeSNum() {
		return themeSNum;
	}
	public void setThemeSNum(String themeSNum) {
		this.themeSNum = themeSNum;
	}
	public Integer getBuyQty() {
		return buyQty;
	}
	public void setBuyQty(Integer buyQty) {
		this.buyQty = buyQty;
	}
	public Timestamp getBuyStartDate() {
		return buyStartDate;
	}
	public void setBuyStartDate(Timestamp buyStartDate) {
		this.buyStartDate = buyStartDate;
	}
	public Timestamp getBuyEndDate() {
		return buyEndDate;
	}
	public void setBuyEndDate(Timestamp buyEndDate) {
		this.buyEndDate = buyEndDate;
	}
	public Integer getBuyDays() {
		return buyDays;
	}
	public void setBuyDays(Integer buyDays) {
		this.buyDays = buyDays;
	}
	public Integer getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(Integer buyPrice) {
		this.buyPrice = buyPrice;
	}

	
	
	
}
