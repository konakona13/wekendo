package Repository.YYYRepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Command.YYYCommand.PlaceRegCommand;
import Model.DTO.YYYDTO.Company;
import Model.DTO.YYYDTO.PlaceGoods;

@Repository
public class ConfirmRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace = "YYY-Mapper";

	public PlaceGoods goodsConfirm(String goodsNum) {
		
		PlaceGoods goods = new PlaceGoods();
		
		goods.setGoodsStatus(goodsNum);
		
		String statement =  namespace + ".upGoodsStatus";
		sqlSession.update(statement, goods.getCompanyNum());
		
		return goods;
	}


	public Company goodsCancel() {
		Company company = new Company();
		
		
		//company.setCompanyStatus();
		
		String statement =  namespace + ".upGoodsStatusX";
		sqlSession.update(statement);
		
		return company;
	}
	
}
