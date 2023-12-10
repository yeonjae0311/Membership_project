package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.OrderDetailVO;

public class OrderDetailDAO {
	SqlSession sqlSession;
	
	public OrderDetailDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<OrderDetailVO> select_order_detail_list(int o_idx){
		return sqlSession.selectList("o.select_order_detail_list",o_idx);
	}
	
}
