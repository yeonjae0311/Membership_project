package dao;

import org.apache.ibatis.session.SqlSession;

public class MemberDAO {
	SqlSession sqlSession;
	
	public MemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
