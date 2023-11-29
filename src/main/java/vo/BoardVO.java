package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardVO {
	private int b_idx,
				m_idx;
    private String b_content,
    			   b_postedDate,
    			   b_title,
    			   b_isfixed,
    			   b_ip;
}

