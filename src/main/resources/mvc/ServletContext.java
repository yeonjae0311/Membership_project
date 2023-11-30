package mvc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.korea.membership.BoardController;
import com.korea.membership.MemberController;
import com.korea.membership.ShopController;
import com.korea.membership.UserController;

import dao.BoardDAO;
import dao.ItemDAO;
import dao.PMemberDAO;

@Configuration
@EnableWebMvc
public class ServletContext implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	@Bean
	public MemberController memberController(PMemberDAO member_dao) {
		return new MemberController(member_dao);
	}
	

	@Bean 
	public ShopController shopController1(ItemDAO item_dao) {
		return new ShopController(item_dao);
	}
	
	@Bean 
	public UserController userController() {
		return new UserController();
	}
	
	@Bean
	public BoardController boardController(BoardDAO board_dao) {
		return new BoardController(board_dao);
	}
}
