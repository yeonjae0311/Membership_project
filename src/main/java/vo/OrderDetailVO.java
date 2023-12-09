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
    			od_sum
    			;
}

