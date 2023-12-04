package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.StoryLikedVO;
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
	
	public StoryLikedVO check_isliked(HashMap<String, Object> map) {
		return sqlSession.selectOne("s.check_isliked",map);
	}
	
	public List<StoryVO> select_story_list(int m_idx){
		return sqlSession.selectList("s.select_story_list_with_m_idx",m_idx);
	}
	
}
