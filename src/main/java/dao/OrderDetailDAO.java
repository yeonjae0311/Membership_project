package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.OrderDetailVO;

public class OrderDetailDAO {
	SqlSession sqlSession;
	
	public OrderDetailDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	public int order_detail_insert(Map<String, Object> map_detail) {
		return sqlSession.insert("o.order_detail_insert", map_detail);
	}

}
