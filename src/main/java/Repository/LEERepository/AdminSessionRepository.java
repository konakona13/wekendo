package Repository.LEERepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.LEEDTO.Buybuy;
import Model.DTO.LEEDTO.CashIn;
import Model.DTO.LEEDTO.Dodo;
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
}
