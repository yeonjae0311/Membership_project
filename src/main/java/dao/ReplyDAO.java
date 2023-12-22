package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardPMemberReplyViewVO;
import vo.BoardVO;
import vo.ReplyVO;

public class ReplyDAO {
	SqlSession sqlSession;
	
	public ReplyDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert_reply(ReplyVO vo) {
		return sqlSession.insert("r.insert_reply",vo);
	}
	
	public List<BoardPMemberReplyViewVO> select_reply_list(HashMap<String, Object> map){
		return sqlSession.selectList("r.select_reply_list",map);
	}
	
	public int delete_replys_by_b_idx(int b_idx) {
		return sqlSession.delete("r.delete_replys_by_b_idx",b_idx);
	}
	
	public int add_reply_like(HashMap<String, Object> map) {
		return sqlSession.insert("r.add_reply_like",map);
	}
	
	public int delete_reply_to_unlike(HashMap<String, Object> map) {
		return sqlSession.delete("r.delete_reply_to_unlike",map);
	}
	
	public int update_reply_like_count(int r_idx) {
		return sqlSession.update("r.update_reply_like_count",r_idx);
	}
	
	public int delete_reply_by_writer(HashMap<String, Object> map) {
		return sqlSession.delete("r.delete_reply_by_writer",map);
	}
	
	public int delete_reply_by_master(int r_idx) {
		return sqlSession.delete("r.delete_reply_by_master",r_idx);
	}
	
	public int select_one_reply(HashMap<String, Object> map) {
		return sqlSession.selectOne("r.select_one_reply", map);
	}
	
	public int update_reply(ReplyVO vo) {
		return sqlSession.update("r.update_reply",vo);
	}
}
