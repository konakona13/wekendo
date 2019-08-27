package Repository.HHHRepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import Command.HHHCommand.DoCreatePay;
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
	public String insertKendo(Kendo kendo, DoPayComplete doPayComplete, DoCreatePay doCreatePay)
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
		
		statement =  namespace + ".insertBuy";
		
		System.out.println("검증디버그 시작");
		System.out.println("getBuyStartDate : " + doCreatePay.getBuyStartDate());
		System.out.println("getBuyEndDate : " + doCreatePay.getBuyEndDate());
		System.out.println("getDoNum : " + doCreatePay.getDoNum());
		System.out.println("getPayNum : " + doCreatePay.getPayNum());
		System.out.println("getBuyPrice : " + doCreatePay.getBuyPrice());
		System.out.println("hostNum : " + doCreatePay.getHostNum());
		System.out.println("getBuyPrice : " + doCreatePay.getPlaceNum());
//		#{hostNum},#{PlaceNum}
//		, #{companyNum},#{mapLNum},#{mapMNum},#{mapSNum},#{themeLNum},#{themeMNum},#{themeSNum},
//		#{buyQty},#{buyStartDate},#{buyEndDate},#{buyDays},#{buyPrice}
		
		result = sqlSession.insert(statement,doCreatePay);
		
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
