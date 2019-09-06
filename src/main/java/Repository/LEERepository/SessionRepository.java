package Repository.LEERepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.LEEDTO.Buybuy;
import Model.DTO.LEEDTO.Company;
import Model.DTO.LEEDTO.Member;

@Repository
public class SessionRepository {
	@Autowired
	private SqlSession sqlSession;

	private final String namespace = "LEE-Mapper";

	public void insertMem(Member mem) {
		// TODO Auto-generated method stub
		String statement = namespace + ".memberInsert";
		sqlSession.insert(statement, mem);
	}

	public Member userCheck(String memberId, String memberPw) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		String statement = namespace + ".userCheck";
		member = sqlSession.selectOne(statement, member);
		return member;
	}

	public void insertCompany(Company com) {
		// TODO Auto-generated method stub
		String statement = namespace + ".companyInsert";
		sqlSession.insert(statement, com);
	}

	public Company comCheck(String id1, String pw) {
		// TODO Auto-generated method stub
		Company company = new Company();
		company.setCompanyId(id1);
		company.setCompanyPw(pw);
		String statement = namespace + ".companyCheck";
		company = sqlSession.selectOne(statement, company);
		return company;
	}

	public String getSelectId(String id1) {
		// TODO Auto-generated method stub
		String memberId = null;
		Member member = new Member();
		member.setMemberId(id1);
		String statement = namespace + ".userCheck1";
		member = sqlSession.selectOne(statement, member);
		if (member != null) {
			memberId = member.getMemberId();
		}
		return memberId;
	}

	public List<Buybuy> getOrderList(String comNum) {
		// TODO Auto-generated method stub
		List<Buybuy> result = null;
		String statement = namespace + ".getOrderList";
		result = sqlSession.selectList(statement, comNum);
		return result;
	}
}
