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
	
	// i_amount보다 cd_count가 큰 경우 cd_count--> i_amount
	public int cd_count_check(int i_amount) {
		return sqlSession.update("cd.cd_count_check", i_amount);
	}
	
	// 장바구니 페이지에서 아이템 수량 변경 
	public int item_detail_amount_update(int cd_count) {
		return sqlSession.update("cd.item_detail_amount_update", cd_count);
	}
	
	// 장바구니 페이지에서 아이템 삭제
	public int cart_delete(Map<String, Integer> idx_map) {
		return sqlSession.delete("cd.cart_delete", idx_map);
	}
	
	// 결제 후 장바구니 초기화
	public int cart_delete_all(int m_idx) {
		return sqlSession.delete("cd.cart_delete_all", m_idx);
	}

}
