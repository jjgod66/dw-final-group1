package kr.or.dw.vo;

import lombok.Data;

@Data
public class MemBuyVO {

	private String merchant_uid;
	private String product_cd;
	private String mem_cd;
	private String buydate;
	private String amount;
	private String discount;
	private String pricesum;
	private String mem_coupon_no;
	private String use_point;
}
