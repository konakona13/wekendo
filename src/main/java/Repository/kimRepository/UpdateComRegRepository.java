package Repository.kimRepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.kimDTO.Company;

@Repository
public class UpdateComRegRepository {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Company company;
	
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
	

	
	
	
}
