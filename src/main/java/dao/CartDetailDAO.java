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
	public List<CartDetailVO> cart_select_list(int m_idx) {
		return sqlSession.selectList("cd.cart_select_list", m_idx);
	}
	
	// 장바구니 개수 변경
	public int cart_item_count_change(Map<String, Integer> map) {
		return sqlSession.update("cd.cart_item_count_change", map);
	}
	
	// shop_item 페이지

}
