package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	SqlSession sqlSession;
	
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//전체 게시글 조회 인자가 "1"일경우 공지사항글
	//"0"일경우 유저가 쓴 글
	public List<BoardVO> select_board_list(String b_isfixed){		
		return sqlSession.selectList("b.board_list",b_isfixed);
	}
}
