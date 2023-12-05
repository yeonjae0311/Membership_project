package dao;

import java.util.HashMap;
import java.util.Map;

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
	public int id_check(String m_id) {
		return sqlSession.selectOne("pm.id_check", m_id);
	}
	
	// 이메일 중복 체크
	public int email_check(String m_email) {
		return sqlSession.selectOne("pm.email_check", m_email);

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
	public PMemberVO select_one(int m_idx) {
		PMemberVO vo = sqlSession.selectOne("pm.select_one", m_idx);
		return vo;
	}

	// 탈퇴하기
	public int del_update(PMemberVO vo) {
		return sqlSession.update("pm.del_update", vo);
	}
	
	// 아이디 찾기
	public PMemberVO id_find(String m_email) {
		return sqlSession.selectOne("pm.id_find", m_email);
	}
	
	// 비밀번호 수정
	public int password_update(Map<String, String> m_map) {
		return sqlSession.update("pm.password_update", m_map);
	}

	//수정하기
	public int user_info_update(PMemberVO vo) {
		return sqlSession.update("pm.user_info_update", vo);
	}
	
	//프로필 사진 수정하기
	public int photo_upload(HashMap<String, Object> map) {
		return sqlSession.update("pm.photo_upload", map);
	}
	
	//프로필 수정
	public int user_profile_update(PMemberVO vo) {
		return sqlSession.update("pm.user_profile_update", vo);
	}
}
