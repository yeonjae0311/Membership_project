package vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PMemberVO {
	private int m_idx;
<<<<<<< HEAD
	private String m_username,
	               m_name,
	               m_tel,
	               m_password,
	               m_email,
	               m_ismaster,
=======
	private String m_ismaster,
>>>>>>> cwh_login
	               m_ismembership,
	               m_validdate,
	               m_addr1,
	               m_addr2,
	               m_addr3,
<<<<<<< HEAD
	               m_date_of_birth;
=======
	               mail_auth;
	
	private String m_username;
	
	private String m_name;
	
	private String m_password;
	
	private String m_email;
	
	private Date join_date;

    private String mail_key;
				   
>>>>>>> cwh_login
}

