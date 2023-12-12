package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.StoryVO;

public class StoryDAO {
	SqlSession sqlSession;
	
	public StoryDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int story_post_insert(StoryVO vo) {
		return sqlSession.insert("s.story_post_insert",vo);
	}
	
//	public StoryVO select_story_one(HashMap<String, Object> map) {
//		return sqlSession.selectOne("s.select_story_one",map);
//	}
	
	public StoryVO select_story_one(String s_idx) {
		return sqlSession.selectOne("s.select_story_one_by_s_idx",s_idx);
	}
	
	public int check_is_liked(HashMap<String, Object> map) {
		return sqlSession.selectOne("s.check_is_liked",map);
	}
	
	public List<StoryVO> select_story_list(int m_idx){
		return sqlSession.selectList("s.select_story_list_with_m_idx",m_idx);
	}
	
	public int insert_like(HashMap<String, Object> map) {
		return sqlSession.insert("s.insert_like",map);
	}
	
	public int delete_to_unlike(HashMap<String, Object> map) {
		return sqlSession.delete("s.delete_to_unlike",map);
	}	
	
	public int recalculate_total_like(int s_idx) {
		return sqlSession.update("s.recalculate_total_like",s_idx);
	}
	
	public int story_update_read_hit(int s_idx) {
		return sqlSession.update("s.story_update_read_hit",s_idx);
	}
}
