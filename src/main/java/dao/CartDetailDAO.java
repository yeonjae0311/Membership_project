package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CartDetailVO;

public class CartDetailDAO {
	SqlSession sqlSession;
	
	public CartDetailDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 장바구니(테이블)에 추가
	public int cart_insert(Map<String, Integer> idx_map) {
		return sqlSession.insert("cd.cart_insert", idx_map);
	}
	
	// 장바구니 전체 조회
	public List<CartDetailVO> cart_select_list() {
		return sqlSession.selectList("cd.cart_select_list");
	}

}
