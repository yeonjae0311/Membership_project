package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class POrderVO {
	private int o_idx,
				m_idx,
				o_sum,
    			o_count;
	private String i_names;

}

