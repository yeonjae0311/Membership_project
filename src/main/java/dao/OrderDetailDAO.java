package dao;

import java.util.List;
import java.util.Map;

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
	
	public List<OrderDetailVO> select_order_detail_list(int o_idx){
		return sqlSession.selectList("o.select_order_detail_list",o_idx);
	}

}
