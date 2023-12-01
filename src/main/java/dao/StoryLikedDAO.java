package dao;

import org.apache.ibatis.session.SqlSession;

public class StoryLikedDAO {
	SqlSession sqlSession;
	
	public StoryLikedDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
