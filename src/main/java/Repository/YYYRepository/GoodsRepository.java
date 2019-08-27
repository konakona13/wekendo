package Repository.YYYRepository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.YYYDTO.Company;
import Model.DTO.YYYDTO.GoodsImg;
import Model.DTO.YYYDTO.PlaceGoods;

@Repository
public class GoodsRepository {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Company company;
	
	private String namespace = "YYY-Mapper";
	private String goodsNum= "";
	
	//상품등록
	public String insertPlace(PlaceGoods placeGoods, GoodsImg goodsImg, List<String> list) {
		
		int result = 0;
		String statement= "";
		
		statement =  namespace + ".placeRegist"; 
		result = sqlSession.insert(statement, placeGoods);
		System.out.println("상품테이블 입력 완료 -" + statement);
		
		statement = namespace + ".getMaxNum";
		//System.out.println("2: " + statement);
		
		goodsNum = sqlSession.selectOne(statement);
		//System.out.println("?" + goodsNum);

		goodsImg.setGoodsNum(goodsNum);
		//goodsImg.setList(list);
		
		for(String list2 : list) {
			goodsImg.setGoodsImgName(list2);
			statement = namespace + ".setGoodsImg";
			result = sqlSession.insert(statement, goodsImg);
		}
		
		
		return goodsNum;
	}
	
	
	
	
	//상품리스트 
	//회원용
	public List<PlaceGoods> getGoodsList(String companyNum) {
		List<PlaceGoods> result = null;
		String statement =  namespace + ".getGoodsList"; 
		result = sqlSession.selectList(statement, companyNum);
		
		return result;
	}
	//관리자용
	public List<PlaceGoods> getGoodsAll(){
		List<PlaceGoods> result = null;
		String statement =  namespace + ".getGoodsAll"; 
		result = sqlSession.selectList(statement);
		System.out.println("DB조회 상품 게시글 수 : " +result.size());
		
		return result;
	}
	//회사명 가져오기 위해
	public List<Company> getCompanyList(String companyNum) {
		List<Company> company = null;
		String statement =  namespace + ".getCompanyList"; 
		company = sqlSession.selectList(statement);
		
		return company;
	}


	//상품 상세 
	//1.상품테이블
	
		public PlaceGoods getGoodsDetail(String goodsNum) {
			PlaceGoods goods = null;
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
			String statement =  namespace + ".getCompanyInfo"; 
			System.out.println("DB에서 오는 회사번호: " + companyNum);
			company = sqlSession.selectOne(statement, companyNum);

			return company;
		}
		
		//이미지
		//3.이미지테이블
		public List<GoodsImg> getImages(String goodsNum) {
			
			List<GoodsImg> goodsImg = new ArrayList<GoodsImg>();
			String statement =  namespace + ".getImages"; 
			//System.out.println("이미지 받을 때 DB에서 오는 상품번호: " + goodsNum);
			goodsImg = sqlSession.selectList(statement, goodsNum);
			
			return goodsImg;
		}


		
		//지역,테마 다 가져오기 
		//4.지역,테마테이블
		
}
