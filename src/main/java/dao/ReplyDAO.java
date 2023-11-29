package dao;

import org.apache.ibatis.session.SqlSession;

public class ReplyDAO {
	SqlSession sqlSession;
	
	public ReplyDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
