package dao;

import org.apache.ibatis.session.SqlSession;

public class StoryDAO {
	SqlSession sqlSession;
	
	public StoryDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
