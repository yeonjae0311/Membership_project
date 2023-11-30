package context;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.BoardDAO;
import dao.PMemberDAO;

@Configuration
public class Context_3_dao {
	
	@Bean
	public PMemberDAO pmemberDAO(SqlSession sqlSession) {
		return new PMemberDAO(sqlSession);
	}
	
	@Bean
	public BoardDAO boardDAO(SqlSession sqlSession) {
		return new BoardDAO(sqlSession);
	}

}