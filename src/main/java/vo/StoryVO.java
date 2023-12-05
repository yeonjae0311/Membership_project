package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class StoryVO {
	private int s_idx,
				m_idx;
    private String s_content,
    			   s_postedDate,
    			   s_title,
    			   s_filename;
}
