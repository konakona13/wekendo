package Model.DTO.HHHDTO;
import java.io.Serializable;
import java.sql.Timestamp;


@SuppressWarnings("serial")
public class PlaceGoods implements Serializable
{
	
	String goodsNum;
	String mapLNum;
	String mapMNum;
	String mapSNum;
	String themeLNum;
	String themeMNum;
	String themeSNum;
	String goodsName;
	Integer goodsPrice;
	String goodsDetail;
	String goodsDanger;
	String goodsStatus;
	Integer goodsStock;
	String companyNum;
	Timestamp regDate;
	
	
	public Timestamp getRegDate()
	{
		return regDate;
	}
	public void setRegDate(Timestamp regDate)
	{
		this.regDate = regDate;
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
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
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
	public Integer getGoodsStock() {
		return goodsStock;
	}
	public void setGoodsStock(Integer goodsStock) {
		this.goodsStock = goodsStock;
	}
	public String getCompanyNum() {
		return companyNum;
	}
	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}
	public Integer getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(Integer goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	
	

}
