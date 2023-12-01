package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PMemberVO {
	private int m_idx;
	private String m_username,
	               m_name,
	               m_tel,
	               m_password,
	               m_email,
	               m_ismaster,
	               m_ismembership,
	               m_validdate,
	               m_addr1,
	               m_addr2,
	               m_addr3,
	               m_date_of_birth;
}

