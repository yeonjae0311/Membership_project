package vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PMemberVO {
	private int m_idx;
	private String m_ismaster,
	               m_ismembership,
	               m_validdate,
	               m_addr1,
	               m_addr2,
	               m_addr3,
	               mail_auth;
	
	private String m_username;
	
	private String m_name;
	
	private String m_password;
	
	private String m_email;
	
	private Date join_date;

    private String mail_key;
				   
}

