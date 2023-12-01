package context;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.BoardDAO;
import dao.CartDetailDAO;
import dao.CartDetailDAO;
import dao.CartDetailDAO;
import dao.ItemDAO;
import dao.PMemberDAO;

@Configuration
public class Context_3_dao {
	
	@Bean
	public PMemberDAO memberDAO(SqlSession sqlSession) {
		return new PMemberDAO(sqlSession);
	}
	
	@Bean
	public ItemDAO itemDAO(SqlSession sqlSession) {
		return new ItemDAO(sqlSession);
	}
	
	@Bean
	public BoardDAO boardDAO(SqlSession sqlSession) {
		return new BoardDAO(sqlSession);
	}
	
	@Bean
	public CartDetailDAO cartDetailDAO(SqlSession sqlSession) {
		return new CartDetailDAO(sqlSession);
	}
}