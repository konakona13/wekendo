package Repository.kimRepository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Command.kimCommand.GuestPayCommand;
import Command.kimCommand.KendoJoinCommand;
import Model.DTO.kimDTO.Friend;
import Model.DTO.kimDTO.GuestPay;
import Model.DTO.kimDTO.Kendo;
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
	private Kendo kendo;
	
	private final String namespace = "KIM-Mapper";

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

	public List<Kendo> getKendoJoinList() {
		List<Kendo> result = null;

		String statement =  namespace + ".getKendoJoinList"; 
		result = sqlSession.selectList(statement);
		return result;
	}



}
