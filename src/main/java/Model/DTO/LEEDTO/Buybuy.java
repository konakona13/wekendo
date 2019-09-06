package Model.DTO.LEEDTO;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class Buybuy implements Serializable {
	private String buyNum;
	private String doNum;
	private String payNum;
	private String hostNum;
	private String goodsNum;
	private String companyNum;
	private String mapLnum;
	private String mapMnum;
	private String mapSnum;
	private String themeLnum;
	private String themeMnum;
	private String themeSnum;
	private Long buyQty;
	private Timestamp startDate;
	private Timestamp endDate;
	private Long buyDays;
	private Long buyPrice;
	private String companyName;
	private String goodsName;
	private String doName;
	private Timestamp dutchDate;
	private Long payPP;
	private Long payDutch;
	private String memName;
	private Long goodsStock;
	private Long goodsPrice;

	public Long getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(Long goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public Long getGoodsStock() {
		return goodsStock;
	}

	public void setGoodsStock(Long goodsStock) {
		this.goodsStock = goodsStock;
	}

	public Long getPayPP() {
		return payPP;
	}

	public void setPayPP(Long payPP) {
		this.payPP = payPP;
	}

	public Long getPayDutch() {
		return payDutch;
	}

	public void setPayDutch(Long payDutch) {
		this.payDutch = payDutch;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public Timestamp getDutchDate() {
		return dutchDate;
	}

	public void setDutchDate(Timestamp dutchDate) {
		this.dutchDate = dutchDate;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getDoName() {
		return doName;
	}

	public void setDoName(String doName) {
		this.doName = doName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

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

	public Long getBuyQty() {
		return buyQty;
	}

	public void setBuyQty(Long buyQty) {
		this.buyQty = buyQty;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public Long getBuyDays() {
		return buyDays;
	}

	public void setBuyDays(Long buyDays) {
		this.buyDays = buyDays;
	}

	public Long getBuyPrice() {
		return buyPrice;
	}

	public void setBuyPrice(Long buyPrice) {
		this.buyPrice = buyPrice;
	}
}