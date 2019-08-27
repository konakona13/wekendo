package Model.DTO.LEEDTO;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class Goods implements Serializable {
	private String goodsNum;
	private String mapLnum;
	private String mapMnum;
	private String mapSnum;
	private String themeLnum;
	private String themeMnum;
	private String themeSnum;
	private String goodsName;
	private Long goodsPrice;
	private String goodsDetail;
	private String goodsDanger;
	private String goodsStatus;
	private Long goodsStock;
	private String companyNum;
	private Timestamp goodsRegDate;
	private String companyName;

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
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

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Long getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(Long goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getGoodsDetail() {
		return goodsDetail;
	}

	public void setGoodsDetail(String goodsDetail) {
		this.goodsDetail = goodsDetail;
	}

	public String getGoodsDanger() {
		return goodsDanger;
	}

	public void setGoodsDanger(String goodsDanger) {
		this.goodsDanger = goodsDanger;
	}

	public String getGoodsStatus() {
		return goodsStatus;
	}

	public void setGoodsStatus(String goodsStatus) {
		this.goodsStatus = goodsStatus;
	}

	public Long getGoodsStock() {
		return goodsStock;
	}

	public void setGoodsStock(Long goodsStock) {
		this.goodsStock = goodsStock;
	}

	public String getCompanyNum() {
		return companyNum;
	}

	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}

	public Timestamp getGoodsRegDate() {
		return goodsRegDate;
	}

	public void setGoodsRegDate(Timestamp goodsRegDate) {
		this.goodsRegDate = goodsRegDate;
	}
}