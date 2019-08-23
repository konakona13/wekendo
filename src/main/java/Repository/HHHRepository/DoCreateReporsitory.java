package Repository.HHHRepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import Command.HHHCommand.DoPayComplete;
import Model.DTO.HHHDTO.DoIMG;
import Model.DTO.HHHDTO.Kendo;
import Model.DTO.HHHDTO.Member;
import Model.DTO.HHHDTO.PlaceGoods;

public class DoCreateReporsitory
{
	@Autowired
	private SqlSession sqlSession;
	
	String namespace = "CreateGoodsMapper";
	//
	public List<PlaceGoods> getGoodsList()
	{
		List<PlaceGoods> result = null;
		String statement =  namespace + ".placeList";
		result = sqlSession.selectList(statement);
		return result;
		
		
		
	}
	public PlaceGoods getOneGoods(String num)
	{
		PlaceGoods result = null;
		String statement =  namespace + ".getOneGoods";
		result = sqlSession.selectOne(statement,num);
		return result;
		
	}
	public Member getmemberInfo(String memberId)
	{
		Member result = null;
		String statement =  namespace + ".getUserInfo";
		result = sqlSession.selectOne(statement,memberId);
		return result;
	}
	public int insertKendo(Kendo kendo)
	{
		int result = 0;
		String statement =  namespace + ".insertKendo";
		result = sqlSession.insert(statement,kendo);
		System.out.println("활동테이블insert");
		return result;
	}
	public int insertDoimg(DoIMG doImg)
	{
		int result = 0;
		String statement =  namespace + ".insertDoimg";
		result = sqlSession.insert(statement,doImg);
		System.out.println("활동이미지insert");
		return result;
		
	}
	public int insertPayment(DoPayComplete doPayComplete)
	{
		int result = 0;
		
		String statement =  namespace + ".insertPayment";
		String dutch = "";
		String price = doPayComplete.getPrice();
		String pp =  doPayComplete.getPp();
		
		int priceI = Integer.parseInt(price);
		int ppI = Integer.parseInt(pp);
		priceI = priceI/ppI;	
		doPayComplete.setDutch(Integer.toString(priceI));
		
		result = sqlSession.insert(statement,doPayComplete);
		System.out.println("결제테이블insert");
		return result;
	}
	public int inserthostPay(DoPayComplete doPayComplete)
	{
		int result = 0;
		String statement =  namespace + ".insertHostPay";
		result = sqlSession.insert(statement,doPayComplete);
		System.out.println("방장결제insert");
		return result;
	}

	

}
