package Repository.HHHRepository;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import Command.HHHCommand.DoCreatePay;
import Command.HHHCommand.DoPayComplete;
import Command.HHHCommand.SelectBuyGoods;
import Model.DTO.HHHDTO.Company;
import Model.DTO.HHHDTO.DoIMG;
import Model.DTO.HHHDTO.GoodsImg;
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

		case "rent":
			goodsKind = "GDC";
			break;
			
		case "mento":
			goodsKind = "GDM";
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
		int sumPrice = 0;
		//가격총합
		@SuppressWarnings("unchecked")
		List<SelectBuyGoods> goodsList = (List<SelectBuyGoods>) session.getAttribute("goodsList");
		for (SelectBuyGoods selectBuyGoods : goodsList)
		{
			sumPrice += Integer.parseInt(selectBuyGoods.getTotalPrice());
		}
		System.out.println("활동 총결제액 : " + sumPrice);
		doPayComplete.setPrice(Integer.toString(sumPrice));
		
		String statement =  namespace + ".insertKendo";
		result = sqlSession.insert(statement,kendo);
		System.out.println("활동테이블insert");
		String doNum = getMaxNum(1);
		doPayComplete.setDoNum(doNum);
		doCreatePay.setDoNum(doNum);
		System.out.println("DoNum 세팅 : doNum");
		
		statement =  namespace + ".insertPayment";
		result = sqlSession.insert(statement,doPayComplete);
		System.out.println("결제테이블insert");
		
		doPayComplete.setPayNum(getMaxNum(2));
		doCreatePay.setPayNum(getMaxNum(2));
		
		String company = doPayComplete.getCardCompany();
		if(company.equals("KAKAO"))
		{
			doPayComplete.setKind("KAKAO");
		}
		else
		{
			doPayComplete.setKind("CARD");
		}
		statement =  namespace + ".insertHostPay";
		result = sqlSession.insert(statement,doPayComplete);
		System.out.println("방장결제insert");
		
		
		
		
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
			
			
			
			statement = namespace + ".updateGoodsStock";
			sqlSession.insert(statement,selectBuyGoods.getGoodPlaceNum());
			
			statement =  namespace + ".insertBuy2";
			sqlSession.insert(statement,doCreatePay);
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

	public List<Company> getCpList()
	{
		String statement = null;
		statement = namespace + ".getCpList";
		
		List<Company> cPlist =	sqlSession.selectList(statement);
		
		
		return cPlist;
	}

	public List<GoodsImg> getGoodsImg()
	{
		String statement = null;
		statement = namespace + ".getImgList";
		List<GoodsImg> gIList = sqlSession.selectList(statement);
		return gIList;
	}

	public Company getOneComp(String companyNum)
	{
		String statement = null;
		statement = namespace + ".getOneCompany";
		Company comp = sqlSession.selectOne(statement,companyNum);
		return comp;
	}
	
	
	

	

}
