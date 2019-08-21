package Repository.YYYRepository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.DTO.YYYDTO.MapLarge;
import Model.DTO.YYYDTO.MapMedium;
import Model.DTO.YYYDTO.MapSmall;
import Model.DTO.YYYDTO.ThemeLarge;
import Model.DTO.YYYDTO.ThemeMedium;
import Model.DTO.YYYDTO.ThemeSmall;

@Repository
public class DominoRepository {
	
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "YYY-Mapper";


	public List<MapLarge> selectMapL() {
		String statement = namespace + ".selectMapLarge";
		List<MapLarge> result = sqlSession.selectList(statement);
		
		return result;
	}


	public List<MapMedium> selectMapM(MapLarge large) {
		String statement = namespace + ".selectMapMedium";
		List<MapMedium> list = sqlSession.selectList(statement, large);
		
		return list;
	}

	public List<MapSmall> selectMapS(MapMedium medium) {
		String statement = namespace + ".selectMapSmall";
		List<MapSmall> list = sqlSession.selectList(statement, medium);
		
		return list;
	}


	public List<ThemeLarge> selectThemeL() {
		String statement = namespace + ".selectThemeLarge";
		List<ThemeLarge> result2 = sqlSession.selectList(statement);
		
		return result2;
	}


	public List<ThemeMedium> selectThemeM() {
		String statement = namespace + ".selectThemeMedium";
		List<ThemeMedium> result3 = sqlSession.selectList(statement);
		
		return result3;
	}


	public List<ThemeSmall> selectThemeS() {
		String statement = namespace + ".selectThemeSmall";
		List<ThemeSmall> result4 = sqlSession.selectList(statement);
		
		return result4;
	}

}
