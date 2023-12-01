package vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PMemberVO {
	private int m_idx;
	private String m_username,
				   m_password,
				   m_id,
				   m_name,
				   m_tel,
				   m_email,
	               m_photo_name,
				   m_ismaster,
	               m_ismembership,
	               m_valid_date,
	               m_addr1,
	               m_addr2,
	               m_addr3,
	               m_date_of_birth;
}

