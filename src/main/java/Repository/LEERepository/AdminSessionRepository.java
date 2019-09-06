package Repository.LEERepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.LEEDTO.Buybuy;
import Model.DTO.LEEDTO.CashIn;
import Model.DTO.LEEDTO.Company;
import Model.DTO.LEEDTO.Dodo;
import Model.DTO.LEEDTO.Dodo2;
import Model.DTO.LEEDTO.Goods;
import Model.DTO.LEEDTO.Member;
import Model.DTO.LEEDTO.StartEndPage;

@Repository
public class AdminSessionRepository {

	@Autowired
	private SqlSession sqlSession;

	private final String namespace = "LEE-Mapper";

	public List<Dodo> getDoList(int page1, int limit) {
		// TODO Auto-generated method stub
		List<Dodo> result = null;
		Long startRow = ((long) page1 - 1) * 10 + 1;
		Long endRow = startRow + limit - 1;
		StartEndPage startEndPage = new StartEndPage();
		startEndPage.setEndRow(endRow);
		startEndPage.setStartRow(startRow);
		String statement = namespace + ".getDoList";
		result = sqlSession.selectList(statement, startEndPage);
		return result;
	}

	public int getDoListCount() {
		// TODO Auto-generated method stub
		int result = 0;
		String statement = namespace + ".getDoListCount";
		result = sqlSession.selectOne(statement);
		return result;
	}

	public Dodo getDoDetail(String doNum) {
		// TODO Auto-generated method stub
		Dodo result = new Dodo();
		String statement = namespace + ".getDoDetail";
		result = sqlSession.selectOne(statement, doNum);
		return result;
	}

	public List<CashIn> getCashList(int page1, int limit) {
		// TODO Auto-generated method stub
		List<CashIn> result = null;
		Long startRow = ((long) page1 - 1) * 10 + 1;
		Long endRow = startRow + limit - 1;
		StartEndPage startEndPage = new StartEndPage();
		startEndPage.setEndRow(endRow);
		startEndPage.setStartRow(startRow);
		String statement = namespace + ".getCashList";
		result = sqlSession.selectList(statement, startEndPage);
		return result;
	}

	public int getCashListCount() {
		// TODO Auto-generated method stub
		int result = 0;
		String statement = namespace + ".getCashListCount";
		result = sqlSession.selectOne(statement);
		return result;
	}

	public List<Buybuy> getBuyList(int page1, int limit) {
		// TODO Auto-generated method stub
		List<Buybuy> result = null;
		Long startRow = ((long) page1 - 1) * 10 + 1;
		Long endRow = startRow + limit - 1;
		StartEndPage startEndPage = new StartEndPage();
		startEndPage.setEndRow(endRow);
		startEndPage.setStartRow(startRow);
		String statement = namespace + ".getBuybuyList";
		result = sqlSession.selectList(statement, startEndPage);
		return result;
	}

	public int getBuyListCount() {
		// TODO Auto-generated method stub
		int result = 0;
		String statement = namespace + ".getBuyListCount";
		result = sqlSession.selectOne(statement);
		return result;
	}

	public List<CashIn> getComNameCashList(int page1, int limit, String comName) {
		// TODO Auto-generated method stub
		List<CashIn> result = null;
		String statement = namespace + ".getCashListComName";
		result = sqlSession.selectList(statement, comName);
		return result;
	}

	public List<Buybuy> getNameBuyList(int page1, int limit, String comName) {
		// TODO Auto-generated method stub
		List<Buybuy> result = null;
		String statement = namespace + ".getBuybuyListComName";
		result = sqlSession.selectList(statement, comName);
		return result;
	}

	public void cashinInsert(String comName) {
		// TODO Auto-generated method stub
		String statement = namespace + ".insertCashin";
		sqlSession.insert(statement, comName);
		//String statement1 = namespace + ".updateKendo";
		//sqlSession.update(statement1, comName);
	}

	public Buybuy getBuyDetail(String buyNum) {
		// TODO Auto-generated method stub
		Buybuy result = new Buybuy();
		String statement = namespace + ".getBuyDetail";
		result = sqlSession.selectOne(statement, buyNum);
		return result;
	}

	public Goods getGoodsDetail(String goodsName) {
		// TODO Auto-generated method stub
		Goods result = new Goods();
		String statement = namespace + ".getGoodsDetail";
		result = sqlSession.selectOne(statement, goodsName);
		return result;
	}

	public Dodo getDoBuyDetail(String doName) {
		// TODO Auto-generated method stub
		Dodo result = new Dodo();
		String statement = namespace + ".getDoBuyDetail";
		result = sqlSession.selectOne(statement, doName);
		return result;
	}

	public List<Dodo2> getDoinGoodsDetail(String doNum1) {
		// TODO Auto-generated method stub
		List<Dodo2> result = null;
		String statement = namespace + ".getDoinGoodsDetail";
		result = sqlSession.selectList(statement, doNum1);
		return result;
	}

	public List<Member> getMemList(int page1, int limit) {
		// TODO Auto-generated method stub
		List<Member> result = null;
		Long startRow = ((long) page1 - 1) * 10 + 1;
		Long endRow = startRow + limit - 1;
		StartEndPage startEndPage = new StartEndPage();
		startEndPage.setEndRow(endRow);
		startEndPage.setStartRow(startRow);
		String statement = namespace + ".getMemList";
		result = sqlSession.selectList(statement, startEndPage);
		return result;
	}

	public int getMemListCount() {
		// TODO Auto-generated method stub
		int result = 0;
		String statement = namespace + ".getMemListCount";
		result = sqlSession.selectOne(statement);
		return result;
	}

	public List<Company> getComList(int page1, int limit) {
		// TODO Auto-generated method stub
		List<Company> result = null;
		Long startRow = ((long) page1 - 1) * 10 + 1;
		Long endRow = startRow + limit - 1;
		StartEndPage startEndPage = new StartEndPage();
		startEndPage.setEndRow(endRow);
		startEndPage.setStartRow(startRow);
		String statement = namespace + ".getComList";
		result = sqlSession.selectList(statement, startEndPage);
		return result;
	}

	public int getComListCount() {
		// TODO Auto-generated method stub
		int result = 0;
		String statement = namespace + ".getComListCount";
		result = sqlSession.selectOne(statement);
		return result;
	}

	public List<Dodo> getHostDoList(String memNum) {
		// TODO Auto-generated method stub
		List<Dodo> result = null;
		String statement = namespace + ".getHostDoList";
		result = sqlSession.selectList(statement, memNum);
		return result;
	}

	public List<Dodo> getGuestDoList(String memNum) {
		// TODO Auto-generated method stub
		List<Dodo> result = null;
		String statement = namespace + ".getGuestDoList";
		result = sqlSession.selectList(statement, memNum);
		return result;
	}
}
