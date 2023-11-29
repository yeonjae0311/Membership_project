package dao;

import org.apache.ibatis.session.SqlSession;

public class BIsLikeDAO {
	SqlSession sqlSession;
	
	public BIsLikeDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
