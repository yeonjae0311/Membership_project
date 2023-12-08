package dao;

import org.apache.ibatis.session.SqlSession;

public class POrderDAO {
	SqlSession sqlSession;
	
	public POrderDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int order_insert(int m_idx) {
		return sqlSession.insert("o.porder_insert", m_idx);
	}
}
