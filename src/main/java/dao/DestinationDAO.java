package dao;

import org.apache.ibatis.session.SqlSession;

public class DestinationDAO {
	SqlSession sqlSession;
	
	public DestinationDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
