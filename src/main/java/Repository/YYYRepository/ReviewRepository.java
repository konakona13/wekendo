package Repository.YYYRepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.YYYDTO.GoodsList;
import Model.DTO.YYYDTO.Review;
import Model.DTO.YYYDTO.ReviewList;

@Repository
public class ReviewRepository {
	@Autowired
	private SqlSession sqlSession;
	
	private String namespace = "YYY-Mapper";

	public void makeReview(Review review) {
		
		String statement =  namespace + ".makeReivew"; 
		System.out.println("리뷰테이블 등록 상품번호: " + review.getGoodsNum());
		review = sqlSession.selectOne(statement, review);
		
	}

	public String getMember(String memberNum) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ReviewList> getReview(String goodsNum) {
		List<ReviewList> result = null;
		String statement =  namespace + ".getReview"; 
		result = sqlSession.selectList(statement,goodsNum);
		
		return result;
	}


}
