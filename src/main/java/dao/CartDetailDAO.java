package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class CartDetailDAO {
	SqlSession sqlSession;
	
	public CartDetailDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int cart_insert(Map<String, Integer> idx_map) {
		return sqlSession.insert("c.cart_insert", idx_map);
	}
	
}
