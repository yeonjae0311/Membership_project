package dao;

import org.apache.ibatis.session.SqlSession;

import vo.ReplyVO;

public class ReplyDAO {
	SqlSession sqlSession;
	
	public ReplyDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert_reply(ReplyVO vo) {
		return sqlSession.insert("r.insert_reply",vo);
	}
	
}
