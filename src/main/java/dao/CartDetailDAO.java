package dao;

import org.apache.ibatis.session.SqlSession;

public class CartDetailDAO {
	SqlSession sqlSession;
	
	public CartDetailDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int cart_insert(int i_idx) {
		return sqlSession.insert("c.cart_insert", i_idx);
	}
	
}
