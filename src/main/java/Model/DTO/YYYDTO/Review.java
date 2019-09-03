package Model.DTO.YYYDTO;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Review implements Serializable {
	//13 --> 6
	String reviewNum;
	String goodsNum;
	String memberNum;
	int reviewScore;
	String reviewDate;
	String reviewContent;
	
	
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
	
	
	@Override
    public String toString() {
        return "Review [회원번호=" + memberNum + ", 리뷰=" + reviewContent + ", 상품번호=" + goodsNum + ", 점수=" + reviewScore + "]";
    }

	
	
}
