package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ItemVO;

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
	public List<ItemVO> cart_select_list(int m_idx) {
		return sqlSession.selectList("cd.cart_select_list", m_idx);
	}
	
	// 장바구니 개수 변경
	public int cart_item_count_change(Map<String, Integer> map) {
		return sqlSession.update("cd.cart_item_count_change", map);
	}
	
	// i_amount보다 cd_count가 큰 경우 수정
	public int cd_count_check(int i_amount) {
		return sqlSession.update("cd.cd_count_check", i_amount);
	}
	
	// shop_item 페이지

}
