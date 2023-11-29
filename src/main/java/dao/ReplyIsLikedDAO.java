package dao;

import org.apache.ibatis.session.SqlSession;

public class ReplyIsLikedDAO {
	SqlSession sqlSession;
	
	public ReplyIsLikedDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
