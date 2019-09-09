package Repository.kimRepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.LEEDTO.Buybuy;
import Model.DTO.LEEDTO.CashIn;
import Model.DTO.LEEDTO.Member;
import Model.DTO.LEEDTO.StartEndPage;
import Model.DTO.kimDTO.Company;

@Repository
public class UpdateComRegRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	private final String namespace = "KIM-Mapper";
	
	public List<Company> updateCompanyReg() {
		List<Company> result = null;
		
		String statement =  namespace + ".updateCompanyReg"; 
		result = sqlSession.selectList(statement);
		return result;
	}

	public Company selectCompanyDetail(String companyName) {
		Company company = null;
		String statement =  namespace + ".selectCompanyDetail"; 
		company = sqlSession.selectOne(statement,companyName);
		return company;
	}

	public Company  comRegOk(String companyNum) {
		Company company = new Company();
		
		System.out.println("companyNum : " + companyNum);
		company.setCompanyStatus(companyNum);
		
		String statement =  namespace + ".comRegOk";
		sqlSession.update(statement, companyNum);
		
		return company;	
	}

	public List<Member> getMemList(int page1, int limit) {
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

	public List<Company> getComList(int page1, int limit) {
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

	public int getMemListCount() {
		int result = 0;
		String statement = namespace + ".getMemListCount";
		result = sqlSession.selectOne(statement);
		return result;
	}

	public int getComListCount() {
		int result = 0;
		String statement = namespace + ".getComListCount";
		result = sqlSession.selectOne(statement);
		return result;
	}
	
	
	
	


	
	
	
}
