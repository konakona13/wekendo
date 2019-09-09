package Repository.YYYRepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.YYYDTO.DodoY;
import Model.DTO.YYYDTO.Review;
import Model.DTO.YYYDTO.ReviewList;

@Repository
public class ReviewRepository {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private DodoY doDoY;
	
	private String namespace = "YYY-Mapper";

	public Review makeReview(Review review) {
		
		String statement =  namespace + ".makeReivew"; 
		System.out.println("리뷰테이블 등록 상품번호: " + review.getGoodsNum());
		review = sqlSession.selectOne(statement, review);
		return review;
	}

	/*public List<ReviewList> getReview(String goodsNum) {
		List<ReviewList> result = null;
		String statement =  namespace + ".getReview"; 
		result = sqlSession.selectList(statement,goodsNum);
		
		return result;
	}*/

	public List<DodoY> getDoList(String memNum) {
		List<DodoY> result = null;
		String statement = namespace + ".getDoList";
		result = sqlSession.selectList(statement, memNum);

		return result;
	}

	public List<DodoY> getDoforReview(String doNum) {
		List<DodoY> result = null;
		String statement =  namespace + ".getDoforReview"; 
		//System.out.println("리뷰테이블 활동번호:" + doNum);
		result = sqlSession.selectList(statement, doNum);
		
		return result;
	}


}
