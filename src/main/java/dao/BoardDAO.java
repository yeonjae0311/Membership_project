package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardPMemberViewVO;
import vo.BoardVO;

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
	
	public int board_insert(BoardVO vo) {
		return sqlSession.insert("b.board_insert",vo);
	}
	
<<<<<<< HEAD
	// board_selectOne => board_select_one
=======
>>>>>>> 9527fe2989bdf30e59bcf9165b2f8dc7fb02f821
	public BoardPMemberViewVO board_selectOne(int b_idx) {
		return sqlSession.selectOne("b.board_selectOne",b_idx);
	}
}
