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
}
