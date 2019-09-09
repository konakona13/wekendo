package Repository.YYYRepository;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.YYYDTO.Goods;

@Repository
public class ConfirmRepository {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Goods goods;
	
	private final String namespace = "YYY-Mapper";

	public Goods goodsConfirm(String goodsNum) {
		
		//goods.setGoodsStatus(goodsNum);
		
		String statement =  namespace + ".upGoodsStatus";
		sqlSession.update(statement, goodsNum);
		System.out.println("상품 승인 완료");
		return goods;
	}


	public Goods goodsCancel(String goodsNum) {
		
		
		goods.setGoodsStatus(goodsNum);		
		
		//company.setCompanyStatus();
		
		String statement =  namespace + ".upGoodsStatusX";
		sqlSession.update(statement);
		
		return goods;
	}
	
}
