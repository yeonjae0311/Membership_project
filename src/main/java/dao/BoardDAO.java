package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	SqlSession sqlSession;
	
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
		
	public List<BoardVO> select_list_normal_user(String b_isfixed){
		
		return sqlSession.selectList("b.board_list",b_isfixed);
	}
}
