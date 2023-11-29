package dao;

import org.apache.ibatis.session.SqlSession;

public class ItemDAO {
	SqlSession sqlSession;
	
	public ItemDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
