package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class OrderDetailDAO {
	SqlSession sqlSession;
	
	public OrderDetailDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int order_detail_insert(List<Map<String, Object>> list) {
		return sqlSession.insert("o.order_detail_insert", list);
	}
}
