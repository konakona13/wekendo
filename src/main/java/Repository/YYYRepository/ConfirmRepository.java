package Repository.YYYRepository;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.YYYDTO.PlaceGoods;

@Repository
public class ConfirmRepository {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private PlaceGoods placeGoods;
	
	private final String namespace = "YYY-Mapper";

	public PlaceGoods goodsConfirm(String goodsNum) {
		
		placeGoods.setGoodsStatus(goodsNum);
		
		String statement =  namespace + ".upGoodsStatus";
		sqlSession.update(statement, goodsNum);
		
		return placeGoods;
	}


	public PlaceGoods goodsCancel(String goodsNum) {
		
		
		placeGoods.setGoodsStatus(goodsNum);		
		
		//company.setCompanyStatus();
		
		String statement =  namespace + ".upGoodsStatusX";
		sqlSession.update(statement);
		
		return placeGoods;
	}
	
}
