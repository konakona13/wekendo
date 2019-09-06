package Model.DTO.YYYDTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Review implements Serializable {
	//13
	String reviewNum;
	String goodsNum;
	String memberNum;
	int reviewScore;
	String reviewDate;
	String reviewContent;
	
	String mapLNum;
	String mapMNum;
	String mapSNum;
	String themeLNum;
	String themeMNum;
	String themeSNum;
	
	
	public String getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(String reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
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
	@Override
    public String toString() {
        return "Review [회원번호=" + memberNum + ", 리뷰=" + reviewContent + ", 상품번호=" + goodsNum + ", 점수=" + reviewScore + "]";
    }

	
	
}
