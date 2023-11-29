package dao;

import org.apache.ibatis.session.SqlSession;

public class PMemberDAO {
	SqlSession sqlSession;
	
	public PMemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
