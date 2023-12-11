package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class OrderDetailVO {
	private int od_idx,
				o_idx,
				i_idx;
    private int od_count,

    			od_sum;
    private String i_name,
    			   i_color,
    			   i_photo_name,
    			   i_detail_photo_name;    
    private int i_price;

}

