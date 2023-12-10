package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class OrderDetailDAO {	
	SqlSession sqlSession;
	
	public OrderDetailDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int order_detail_insert(Map<String, Object> map_detail) {
		return sqlSession.insert("o.order_detail_insert", map_detail);
	}
}
