package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardVO {
	private int b_idx,
				m_idx,
				b_read_hit,
				b_like_count;
    private String b_title,
    			   b_content,    
    			   b_postedDate,
    			   b_filename,
    			   b_isfixed,
    			   b_ip;
    private MultipartFile b_file;
    
    @Override
    public String toString() {
    	return b_idx+" "+
    			m_idx+" "+
    			b_title+" "+
    			b_content+" "+
    			b_postedDate+" "+
    			b_filename+" "+
    			b_isfixed+" "+
    			b_ip;
    }
}

