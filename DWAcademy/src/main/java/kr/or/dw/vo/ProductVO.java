package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {

	private String product_cd;
	private String product_name;
	private String product_content;
	private int product_price;
	private String product_div;
	private int product_period;
	private String product_info;
	private String product_pic_path;
	private Date buydate;
	private String gb_use;
	private Date refunddate;
	private String gb_del;
	
	public ProductVO () {};
}
