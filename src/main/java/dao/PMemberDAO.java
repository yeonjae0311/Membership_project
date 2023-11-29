package dao;

import org.apache.ibatis.session.SqlSession;

import vo.PMemberVO;

public class PMemberDAO {
	SqlSession sqlSession;

	public PMemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 아이디가 DB에 존재하는지 체크
	public PMemberVO loginCheck(String id) {
		return sqlSession.selectOne("m.loginCheck", id);
	}

	// 아이디 중복체크
	public int idCheck(String id) {
		return sqlSession.selectOne("m.idCheck", id);
	}

	// 회원가입하기
	public int insert(PMemberVO vo) {
		return sqlSession.insert("m.insert", vo);
	}

}
