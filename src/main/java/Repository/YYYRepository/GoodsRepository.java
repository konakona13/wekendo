package Repository.YYYRepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.PlaceGoods;

@Repository
public class GoodsRepository {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private GoodsImg img;
	
	private String namespace = "YYY-Mapper";
	
	//상품등록
	public void insertGoods(PlaceGoods dto) {
		String statement =  namespace + ".placeRegist"; 
		sqlSession.insert(statement, dto);
	}
	public void insertImg(GoodsImg img) {
		String statement =  namespace + ".imgRegist"; 
		sqlSession.insert(statement, img);
	}
	
	//상품리스트
	public List<PlaceGoods> getGoodsList() {
		List<PlaceGoods> result = null;
		String statement =  namespace + ".getGoodsList"; 
		result = sqlSession.selectList(statement);
		
		return result;
	}
	public List<GoodsImg> getGoodsImg() {
		List<GoodsImg> result = null;
		String statement =  namespace + ".getGoodsImg"; 
		result = sqlSession.selectList(statement);
		
		return result;
	}
	
}
