package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardPMemberViewVO;
import vo.BoardVO;

public class BoardDAO {
	SqlSession sqlSession;
	
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<BoardPMemberViewVO> select_board_list(int m_idx){
		return sqlSession.selectList("b.select_board_list", m_idx);
	}

	public List<BoardPMemberViewVO> fixed_board_list(){
		return sqlSession.selectList("b.fixed_board_list");
	}
	
	public List<BoardPMemberViewVO> unfixed_master_board_list(HashMap<String, Object> map){
		return sqlSession.selectList("b.unfixed_master_board_list",map);
	}
	
	public List<BoardPMemberViewVO> unfixed_master_board_list(){
		return sqlSession.selectList("b.unfixed_master_board_list2");
	}
	
	public List<BoardPMemberViewVO> unfixed_all_board_list(HashMap<String, Object> map){
		return sqlSession.selectList("b.unfixed_all_board_list",map);
	}

	public List<BoardPMemberViewVO> unfixed_all_board_list(){
		return sqlSession.selectList("b.unfixed_all_board_list2");
	}
	
	public int board_insert(BoardVO vo) {
		return sqlSession.insert("b.board_insert",vo);
	}
	
	// board_selectOne => board_select_one
	public BoardPMemberViewVO board_select_one(HashMap<String, Object> map) {
		return sqlSession.selectOne("b.board_select_one",map);
	}
	
	public int delete_board_post(HashMap<String, Object> map) {
		return sqlSession.delete("b.delete_board_post",map);
	}
	
	public int is_master(int m_idx) {
		return sqlSession.selectOne("b.is_master",m_idx);
	}
	
	public int delete_board_post_by_master(int b_idx) {
		return sqlSession.delete("b.delete_board_post_by_master",b_idx);
	}
	
	public int plus_board_read_hit(int b_idx) {
		return sqlSession.update("b.plus_board_read_hit",b_idx);
	}
	
	public int check_like_board(HashMap<String, Object> map) {
		return sqlSession.selectOne("b.check_like_board", map);
	}
	
	public int add_board_like(HashMap<String, Object> map) {
		return sqlSession.insert("b.add_board_like",map);
	}
	
	public int delete_to_unlike(HashMap<String, Object> map) {
		return sqlSession.delete("b.delete_to_unlike",map);
	}
	
	public int recalculate_total_like(int b_idx) {
		return sqlSession.update("b.recalculate_total_like",b_idx);
	}
	
	public int count_unfixed_master_list(HashMap<String, Object> map) {
		return sqlSession.selectOne("b.count_unfixed_master_list",map);
	}
	
	public int count_unfixed_fan_list(HashMap<String, Object> map) {
		return sqlSession.selectOne("b.count_unfixed_fan_list",map);
	}
	
	//home에서 전체 게시물을 조회하기 위한 코드
	public List<BoardVO> select_board_list_popular() {
		return sqlSession.selectList("b.select_board_list_popular");
	}
	
}
