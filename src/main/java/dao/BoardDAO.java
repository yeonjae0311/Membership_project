package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardPMemberViewVO;

public class BoardDAO {
	SqlSession sqlSession;
	
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<BoardPMemberViewVO> fixed_board_list(){
		return sqlSession.selectList("b.fixed_board_list");
	}
	
	public List<BoardPMemberViewVO> unfixed_master_board_list(){
		return sqlSession.selectList("b.unfixed_master_board_list");
	}
	
	public List<BoardPMemberViewVO> unfixed_all_board_list(){
		return sqlSession.selectList("b.unfixed_all_board_list");
	}
}
