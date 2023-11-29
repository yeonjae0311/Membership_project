package dao;

import org.apache.ibatis.session.SqlSession;

public class POrderDAO {
	SqlSession sqlSession;
	
	public POrderDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
