package dao;

import org.apache.ibatis.session.SqlSession;

import vo.PMemberVO;

public class PMemberDAO {
	SqlSession sqlSession;

	public PMemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 아이디가 DB에 존재하는지 체크
	public PMemberVO login_check(String m_username) {
		return sqlSession.selectOne("pm.login_check", m_username);
	}

	// 아이디 중복체크
	public int id_check(String m_username) {
		return sqlSession.selectOne("pm.id_check", m_username);
	}

	// 회원가입하기
	public int insert(PMemberVO vo) {
		return sqlSession.insert("pm.insert", vo);
	}

	// 로그인했는지 체크
	public PMemberVO login_session_check(int idx) {
		PMemberVO vo = sqlSession.selectOne("pm.login_session_check", idx);
		return vo;
	}

	// 회원 탈퇴시 해당 아이디 조회
	public PMemberVO select_one(int idx) {
		PMemberVO vo = sqlSession.selectOne("pm.select_one", idx);
		return vo;
	}

	// 탈퇴하기
	public int del_update(PMemberVO vo) {
		return sqlSession.update("pm.del_update", vo);
	}

}
