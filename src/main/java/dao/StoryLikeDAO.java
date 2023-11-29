package dao;

import org.apache.ibatis.session.SqlSession;

public class StoryLikeDAO {
	SqlSession sqlSession;
	
	public StoryLikeDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
