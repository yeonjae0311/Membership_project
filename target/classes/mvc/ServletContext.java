package mvc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.korea.membership.MemberController;
import com.korea.membership.ShopController;
import com.korea.membership.UserController;

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
	public ShopController shopController() {
		return new ShopController();
	}
	
	@Bean 
	public UserController userController() {
		return new UserController();
	}
}
