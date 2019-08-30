package Repository.LEERepository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DoStatusUpdateRepository {

	@Autowired
	private SqlSession sqlSession;

	private final String namespace = "LEE-Mapper";

	public void doingUpdate(String doing) {
		// TODO Auto-generated method stub
		String statement = namespace + ".updateDoing";
		sqlSession.update(statement, doing);
	}

	public void doendUpdate(String doend) {
		// TODO Auto-generated method stub
		String statement = namespace + ".updateDoend";
		sqlSession.update(statement, doend);
	}

	public void cancelUpdate() {
		// TODO Auto-generated method stub
		String statement = namespace + ".updateCancel";
		sqlSession.update(statement);
	}

}
