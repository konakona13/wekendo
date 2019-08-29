package Repository.kimRepository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.kimDTO.Friend;
import Model.DTO.kimDTO.GuestPay;
import Model.DTO.kimDTO.KendoList;
import Model.DTO.kimDTO.KendoJoin;
@Repository
public class KendoJoinRepository {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private KendoJoin kendoJoin;
	@Autowired
	private Friend friend;
	@Autowired
	private GuestPay guestPay;
	@Autowired
	private KendoList kendo;
	
	private final String namespace = "KIM-Mapper";
	
	public Integer getJoinNumSeq() {
		String statement =  namespace + ".getJoinNumSeq"; 
		Integer joinNumSeq = sqlSession.selectOne(statement);
		
		return joinNumSeq;	
	}

	public Integer getPayNumSeq() {
		String statement =  namespace + ".getPayNumSeq"; 
		Integer payNumSeq = sqlSession.selectOne(statement);
		return payNumSeq;
	}
	
	public void insertKendoJoin(KendoJoin kendoJoin) {
		String statement =  namespace + ".insertKendoJoin"; 
		sqlSession.insert(statement, kendoJoin);	
	}

	public void insertFriend(Friend friend) {
		String statement =  namespace + ".insertFriend"; 
		sqlSession.insert(statement, friend);
		
	}


	public void insertGuestPay(GuestPay guestPay) {
		String statement =  namespace + ".insertGuestPay"; 
		sqlSession.insert(statement, guestPay);
		
	}

	public List<KendoList> getKendoJoinList() {
		List<KendoList> result = null;

		String statement =  namespace + ".getKendoJoinList"; 
		result = sqlSession.selectList(statement);
		return result;
	}

	public int updateDoNowPp(KendoJoin kendoJoin) {

		String statement =  namespace + ".updateDoNowPp";
		
		System.out.println("33kendoJoin.getDoNum:" + kendoJoin.getDoNum());
		System.out.println("kendoJoin.getJoinQty:" + kendoJoin.getJoinQty());
		
		int result = sqlSession.update(statement, kendoJoin);

		return result;
		
	}

	public KendoList selectKendoDetail(String doNum) {
		KendoList kendoList = null;
		String statement =  namespace + ".selectKendoDetail"; 
		kendoList = sqlSession.selectOne(statement,doNum);
		return kendoList;
	}

	public int updateDoInvited(KendoJoin kendoJoin2) {
		String statement =  namespace + ".updateDoInvited";
		
		int invitedResult = sqlSession.update(statement, kendoJoin);
		return invitedResult;
	}







}
