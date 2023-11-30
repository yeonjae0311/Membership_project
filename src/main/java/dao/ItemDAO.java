package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ItemVO;

public class ItemDAO {
	
	SqlSession sqlSession;
	
	public ItemDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// shop 아이템 추가
	public int item_upload(ItemVO vo) {
		return sqlSession.insert("i.item_upload", vo);
	}
	
	// item 리스트 조회
	public List<ItemVO> item_list_select(){
		return sqlSession.selectList("i.item_list_select");
	}
	
	// 선택한 item 한건 조회
	public ItemVO item_select_one(int i_idx) {
		return sqlSession.selectOne("i.item_select_one", i_idx);
	}
	
	// 선택한 item의 모든 색상 조회
	public List<String> item_select_color(String i_name) {
		return sqlSession.selectList("i.item_select_color", i_name);
	}
}
