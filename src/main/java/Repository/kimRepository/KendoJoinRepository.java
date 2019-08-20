package Repository.kimRepository;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Command.kimCommand.GuestPayCommand;
import Command.kimCommand.KendoJoinCommand;
import Model.DTO.kimDTO.Friend;
import Model.DTO.kimDTO.GuestPay;
import Model.DTO.kimDTO.KendoJoin;

public class KendoJoinRepository {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	KendoJoin kendoJoin;
	@Autowired
	Friend friend;
	@Autowired
	GuestPay guestPay;

	
	private final String namespace = "KIM-Mapper";


	public void insertKendoJoin(KendoJoin kendoJoin) {
		String statement =  namespace + ".insertKendoJoin"; 
		sqlSession.insert(statement, kendoJoin);
		
	}


	public void insertfriend(Friend friend) {
		String statement =  namespace + ".insertfriend"; 
		sqlSession.insert(statement, friend);
		
	}


	public void insertguestPay(GuestPay guestPay) {
		String statement =  namespace + ".insertguestPay"; 
		sqlSession.insert(statement, guestPay);
		
	}



}
