package Repository.kimRepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.kimDTO.Letter;

@Repository
public class LetterRepository {
	@Autowired
	private SqlSession  sqlSession;
	@Autowired
	private Letter letter;

	private final String namespace = "KIM-Mapper";
	
	public void sendLetter(Letter letter) {
		String statement =  namespace + ".insertSendLetter"; 
		sqlSession.insert(statement, letter);	
		
	}
	
	public List<Letter> getSendBoxList() {
		List<Letter> result = null;
		
		String statement =  namespace + ".getSendBoxList"; 
		result = sqlSession.selectList(statement);
		return result;

	}

	public List<Letter> getReceiveBoxList() {
		List<Letter> result = null;
		
		String statement =  namespace + ".getReceiveBoxList"; 
		result = sqlSession.selectList(statement);
		return result;
	}
}
