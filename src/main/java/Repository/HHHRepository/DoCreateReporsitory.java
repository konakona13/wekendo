package Repository.HHHRepository;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import Command.HHHCommand.DoCreatePay;
import Command.HHHCommand.DoPayComplete;
import Command.HHHCommand.SelectBuyGoods;
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
	
	public List<PlaceGoods> getGDList(String goodsKind)
	{
		System.out.println("getGDList 리포진입");
		switch (goodsKind)
		{
		case "place":
			goodsKind = "GDP";
			break;
		case "hotel":
			goodsKind = "GDH";
			break;

		default:
			goodsKind = null;
			break;
		}
		
		System.out.println("goodsKind : " + goodsKind);		
		List<PlaceGoods> result = null;
		String statement =  namespace + ".goodsList";
		result = sqlSession.selectList(statement,goodsKind);
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
	public String insertKendo(Kendo kendo, DoPayComplete doPayComplete, DoCreatePay doCreatePay, HttpSession session)
	{
		int result = 0;
		
		String statement =  namespace + ".insertKendo";
		result = sqlSession.insert(statement,kendo);
		System.out.println("활동테이블insert");
		String doNum = getMaxNum(1);
		doPayComplete.setDoNum(getMaxNum(1));
		doCreatePay.setDoNum(getMaxNum(1));
		System.out.println("DoNum 세팅");
		
		statement =  namespace + ".insertPayment";
		result = sqlSession.insert(statement,doPayComplete);
		System.out.println("결제테이블insert");
		
		doPayComplete.setPayNum(getMaxNum(2));
		doCreatePay.setPayNum(getMaxNum(2));
		
		statement =  namespace + ".insertHostPay";
		result = sqlSession.insert(statement,doPayComplete);
		System.out.println("방장결제insert");
		
		
		@SuppressWarnings("unchecked")
		List<SelectBuyGoods> goodsList = (List<SelectBuyGoods>) session.getAttribute("goodsList");
		
		for (SelectBuyGoods selectBuyGoods : goodsList)
		{
			doCreatePay.setSelectBuyGoods(selectBuyGoods);
			PlaceGoods placeGoods = getOneGoods(selectBuyGoods.getGoodPlaceNum());
			doCreatePay.setPlaceGoods(placeGoods);
			System.out.println("검증디버그 시작");
			System.out.println("getBuyStartDate : " + selectBuyGoods.getBuyStartDate());
			System.out.println("getBuyEndDate : " + selectBuyGoods.getBuyEndDate());
			System.out.println("getDoNum : " + doCreatePay.getDoNum());
			System.out.println("getPayNum : " + doCreatePay.getPayNum());
			System.out.println("hostNum : " + doCreatePay.getHostNum());
			System.out.println("getPlaceNum : " + doCreatePay.getPlaceNum());
			System.out.println("getBuyPrice : " + selectBuyGoods.getTotalPrice());
			
//			#{hostNum},#{PlaceNum}
//			, #{companyNum},#{mapLNum},#{mapMNum},#{mapSNum},#{themeLNum},#{themeMNum},#{themeSNum},
//			#{buyQty},#{buyStartDate},#{buyEndDate},#{buyDays},#{buyPrice}
			statement =  namespace + ".insertBuy2";
			result = sqlSession.insert(statement,doCreatePay);
		}
		
		
		
		System.out.println("구매Buy insert");
		
		return doNum;
	}
	public int insertDoimg(DoIMG doImg)
	{
		int result = 0;
		String statement =  namespace + ".insertDoimg";
		result = sqlSession.insert(statement,doImg);
		System.out.println("활동이미지insert");
		return result;
		
	}
	
	public String getMaxNum(int select)
	{
		String statement = null;
		if(select == 1)
		{
			statement =  namespace + ".maxDoNum";
		}
		else	
		{
			statement =  namespace + ".maxPayNum";
		}
		String result = sqlSession.selectOne(statement);
		System.out.println("maxNum : " + result);		
		return result;
	}
	
	
	

	

}
