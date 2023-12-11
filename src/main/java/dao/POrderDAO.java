package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class POrderDAO {
	SqlSession sqlSession;
	
	public POrderDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int order_insert(Map<String, Object> map_order) {
		return sqlSession.insert("o.porder_insert", map_order);
	}
	
	public int o_idx_select(int m_idx) {
		return sqlSession.selectOne("o.o_idx_select", m_idx);
	}
}
