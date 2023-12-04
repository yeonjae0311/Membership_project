package vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardPMemberReplyViewVO {
	private int b_idx,
	            r_idx,
	            m_idx;
	private String m_username,
				   m_photo_name,
				   r_content,
				   r_date,
				   r_ip;
}


