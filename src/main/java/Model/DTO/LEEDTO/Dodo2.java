package Model.DTO.LEEDTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Dodo2 implements Serializable {
	private String doNum;
	private String goodsNum;
	private String companyNum;
	/*
	private String hostNum;
	private String doName;
	private Timestamp startDate;
	private Timestamp endDate;
	private Timestamp openDate;
	private Timestamp closeDate;
	private Long doPP;
	private Long nowPP;
	private String doDetail;
	private String optGender;
	private String optAge;
	private String status;
	*/
	private String doImage;
	private String goodsName;
	private String companyName;
	private String mapLnum;
	private String mapMnum;
	private String mapSnum;
	private String themeLnum;
	private String themeMnum;
	private String themeSnum;
	private Long goodsDays;
	private Long goodsPrice;
	private Long buyPrice;
	
	public Long getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(Long goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public Long getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(Long buyPrice) {
		this.buyPrice = buyPrice;
	}
	public String getDoNum() {
		return doNum;
	}
	public void setDoNum(String doNum) {
		this.doNum = doNum;
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
	public String getDoImage() {
		return doImage;
	}
	public void setDoImage(String doImage) {
		this.doImage = doImage;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getMapLnum() {
		return mapLnum;
	}
	public void setMapLnum(String mapLnum) {
		this.mapLnum = mapLnum;
	}
	public String getMapMnum() {
		return mapMnum;
	}
	public void setMapMnum(String mapMnum) {
		this.mapMnum = mapMnum;
	}
	public String getMapSnum() {
		return mapSnum;
	}
	public void setMapSnum(String mapSnum) {
		this.mapSnum = mapSnum;
	}
	public String getThemeLnum() {
		return themeLnum;
	}
	public void setThemeLnum(String themeLnum) {
		this.themeLnum = themeLnum;
	}
	public String getThemeMnum() {
		return themeMnum;
	}
	public void setThemeMnum(String themeMnum) {
		this.themeMnum = themeMnum;
	}
	public String getThemeSnum() {
		return themeSnum;
	}
	public void setThemeSnum(String themeSnum) {
		this.themeSnum = themeSnum;
	}
	public Long getGoodsDays() {
		return goodsDays;
	}
	public void setGoodsDays(Long goodsDays) {
		this.goodsDays = goodsDays;
	}
	
}
