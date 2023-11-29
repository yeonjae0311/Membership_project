package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReplyVO {
	private int r_idx,
				b_idx,
				m_idx;
    private String r_content,
    			   r_date,
    			   r_ip;
}

