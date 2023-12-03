package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardPMemberReplyViewVO;
import vo.ReplyVO;

public class ReplyDAO {
	SqlSession sqlSession;
	
	public ReplyDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert_reply(ReplyVO vo) {
		return sqlSession.insert("r.insert_reply",vo);
	}
	
	public List<BoardPMemberReplyViewVO> select_reply_list(int b_idx){
		return sqlSession.selectList("r.select_reply_list",b_idx);
	}
	
}
