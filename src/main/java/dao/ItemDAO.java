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
}
