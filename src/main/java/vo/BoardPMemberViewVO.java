package vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardPMemberViewVO {
	private int b_idx,
				m_idx,
				b_read_hit,
				b_like_count,
				b_reply_count;
	private String b_content,
				   b_posted_date,
				   b_title,
				   b_isfixed,
				   b_ip,
				   b_filename,
				   m_username,
				   m_photo_name,
				   m_ismaster,
				   bl_isliked;
}
