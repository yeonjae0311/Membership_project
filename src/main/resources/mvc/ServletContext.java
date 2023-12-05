package mvc;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.korea.membership.BoardController;
import com.korea.membership.MainController;
import com.korea.membership.MemberController;
import com.korea.membership.ReplyConroller;
import com.korea.membership.ShopController;
import com.korea.membership.StoryController;

import dao.BoardDAO;
import dao.CartDetailDAO;
import dao.ItemDAO;
import dao.PMemberDAO;
import dao.ReplyDAO;
import dao.StoryDAO;

@Configuration
@EnableWebMvc
public class ServletContext implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
	public MainController main_controller() {
		return new MainController();
	}

	@Bean
	public MemberController member_controller(PMemberDAO member_dao, BoardDAO board_dao) {
		return new MemberController(member_dao, board_dao);
	}
	
	@Bean
	public ShopController shop_controller(ItemDAO item_dao, CartDetailDAO cart_detail_dao, BoardDAO board_dao) {
		return new ShopController(item_dao, cart_detail_dao, board_dao);
	}

	@Bean
	public BoardController board_controller(BoardDAO board_dao,ReplyDAO reply_dao) {
		return new BoardController(board_dao,reply_dao);
	}
	
	@Bean
	public StoryController story_controller(StoryDAO story_dao) {
		return new StoryController(story_dao);
	}
	
	@Bean
	public ReplyConroller reply_controller(ReplyDAO reply_dao) {
		return new ReplyConroller(reply_dao);
	}

	@Bean
	public JavaMailSender javaMailSender() {

		Properties mailProperties = new Properties();
		mailProperties.put("mail.transport.protocol", "smtp");
		mailProperties.put("mail.smtp.auth", "true");
		mailProperties.put("mail.smtp.starttls.enable", "true");
		mailProperties.put("mail.smtp.debug", "true");
		mailProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		mailProperties.put("mail.smtp.ssl.protocols", "TLSv1.2");

		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setJavaMailProperties(mailProperties);
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("chai0805123@gmail.com");
		mailSender.setPassword("dowunvhjmsinzogu");
		mailSender.setDefaultEncoding("utf-8");
		return mailSender;
	}
}
