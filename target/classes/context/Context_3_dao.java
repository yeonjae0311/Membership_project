package context;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.BoardDAO;
import dao.CartDetailDAO;
import dao.ItemDAO;
import dao.PMemberDAO;
import dao.ReplyDAO;

@Configuration
public class Context_3_dao {
	
	@Bean
	public PMemberDAO member_DAO(SqlSession sqlSession) {
		return new PMemberDAO(sqlSession);
	}
	
	@Bean
	public ItemDAO item_DAO(SqlSession sqlSession) {
		return new ItemDAO(sqlSession);
	}
	
	@Bean
	public BoardDAO board_DAO(SqlSession sqlSession) {
		return new BoardDAO(sqlSession);
	}
	
	@Bean
	public CartDetailDAO cart_detail_DAO(SqlSession sqlSession) {
		return new CartDetailDAO(sqlSession);
	}
<<<<<<< HEAD
=======
	
	@Bean
	public ReplyDAO reply_DAO(SqlSession sqlSession) {
		return new ReplyDAO(sqlSession);
	}
	
>>>>>>> 4b08a9ab10efa453b76b8b70c4c7452b47b52517
}