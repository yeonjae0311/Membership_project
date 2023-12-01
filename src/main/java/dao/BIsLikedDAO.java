package dao;

import org.apache.ibatis.session.SqlSession;

public class BIsLikedDAO {
	SqlSession sqlSession;
	
	public BIsLikedDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
