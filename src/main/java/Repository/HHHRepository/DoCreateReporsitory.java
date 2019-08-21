package Repository.HHHRepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

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
		return result;
	}
	public int insertDoimg(DoIMG doImg)
	{
		int result = 0;
		String statement =  namespace + ".insertDoimg";
		result = sqlSession.insert(statement,doImg);
		return result;
		
	}

	

}
