package Repository.YYYRepository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.YYYDTO.Company;
import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.GoodsList;
import Model.DTO.YYYDTO.MapTheme;
import Model.DTO.YYYDTO.Goods;

@Repository
public class GoodsRepository {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Company company;
	@Autowired
	private GoodsList goodsList;
	
	private String namespace = "YYY-Mapper";
	private String goodsNum= "";
	
	//상품등록
	public String insertPlace(Goods placeGoods, GoodsImg goodsImg, List<String> list) {
		
		int result = 0;
		String statement= "";
		String goodsNum2 = "";
		
		statement =  namespace + ".getGoodsNum"; 
		goodsNum2 = sqlSession.selectOne(statement);
		placeGoods.setGoodsNum2(goodsNum2);
		
		statement =  namespace + ".placeRegist"; 
		result = sqlSession.insert(statement, placeGoods);
		System.out.println("상품테이블 입력 완료 -" + statement);
		
		String comNum = goodsImg.getCompanyNum();
		System.out.println(comNum);
		
		//statement = namespace + ".getMaxNum";
		//System.out.println("2: " + statement);
		
		//goodsNum = sqlSession.selectOne(statement,comNum);
		goodsNum = placeGoods.getGoodsNum();
		goodsImg.setGoodsNum(goodsNum+goodsNum2);
		System.out.println("이미지테이블 들어갈때 상품번호 : " + goodsNum);
		//goodsImg.setList(list);
		
		for(String list2 : list) {
			
			goodsImg.setGoodsImgName(list2);
			statement = namespace + ".setGoodsImg";
			result = sqlSession.insert(statement, goodsImg);
		}
		System.out.println("상품이미지 입력완료 이미지 장 수: " + list.size());
		
		return goodsNum;
	}
	
	
	
	
	//상품리스트 
	//기업회원용
	public List<GoodsList> getGoodsList(String companyNum) {
		List<GoodsList> result = null;
		String statement =  namespace + ".getGoodsList"; 
		result = sqlSession.selectList(statement, companyNum);
		
		return result;
	}
	//관리자용
	public List<GoodsList> getGoodsAll(){
		List<GoodsList> result = null;
		String statement =  namespace + ".getGoodsAll"; 
		result = sqlSession.selectList(statement);
		//System.out.println("DB조회 상품 게시글 수 : " +result.size());
		
		return result;
	}
	//일반회원용
	public List<GoodsList> memGetGoods() {
		List<GoodsList> result = null;
		String statement =  namespace + ".memGetGoods"; 
		result = sqlSession.selectList(statement);
		
		return result;
	}



	//상품 상세 
	//1.상품테이블
	
		public Goods getGoodsDetail(String goodsNum) {
			Goods goods = null;
			//System.out.println("서비스에서 받아오는 상품번호  : " +  goodsNum);
			String statement =  namespace + ".getGoodsDetail"; 
			//System.out.println("DB에서 오는 상품번호: " + goodsNum);
			goods = sqlSession.selectOne(statement, goodsNum);
			
			return goods;
		}
		
		//회사명 가져오기 위해 
		//2.기업회원테이블
		
		public Company getCompanyDetail(String companyNum) {
			
			//System.out.println("서비스에서 받아오는 회사번호  : " +  companyNum);
			String statement =  namespace + ".getCompanyDetail"; 
			System.out.println("DB에서 오는 회사번호: " + companyNum);
			company = sqlSession.selectOne(statement, companyNum);

			return company;
		}
		public GoodsList getCompanyInfo(String goodsNum) {
			String statement =  namespace + ".getCompanyInfoM"; 
			goodsList = sqlSession.selectOne(statement, goodsNum);
			
			return goodsList;
		}

		
		//이미지
		//3.이미지테이블
		public List<GoodsImg> getimages(String goodsNum) {
			
			List<GoodsImg> goodsImg = new ArrayList<GoodsImg>();
			String statement =  namespace + ".getimages"; 
			System.out.println("이미지 받을 때 DB에서 오는 상품번호: " + goodsNum);
			goodsImg = sqlSession.selectList(statement, goodsNum);
			
			return goodsImg;
		}

		//그냥 가져오기
		public List<GoodsImg> getimages() {
			List<GoodsImg> goodsImg = new ArrayList<GoodsImg>();
			String statement =  namespace + ".getimagesAll"; 
			goodsImg = sqlSession.selectList(statement);
			
			return goodsImg;

		}


		
		//지역,테마 다 가져오기 
		//4.지역,테마테이블
		public MapTheme getDominoDetail(String goodsNum) {
			MapTheme maptheme = null;
			String statement =  "";
			System.out.println("goodsNum"+goodsNum);
			statement = namespace + ".getDominoDetail"; 
			maptheme = sqlSession.selectOne(statement, goodsNum);
			
			return maptheme;
		}


		public void deleteGoods(String goodsNum) {
			String statement =  "";
			statement = namespace + ".deleteGoods"; 
			sqlSession.selectOne(statement, goodsNum);
			
			statement =  namespace + ".deleteGoodsImg"; 
			sqlSession.selectOne(statement, goodsNum);
		}


















		
}
