package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ItemVO {
	private int i_idx,
				i_price,
				i_amount,
				cd_count;
    private String i_name,
    			   i_color,
    			   i_photo_name,
    			   i_detail_photo_name;
    private MultipartFile i_photo, 
    					  i_detail_photo;
}

