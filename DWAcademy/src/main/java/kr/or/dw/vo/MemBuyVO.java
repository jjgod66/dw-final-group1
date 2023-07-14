package kr.or.dw.vo;

import lombok.Data;

@Data
public class MemBuyVO {

	private String merchant_uid;
	private String product_cd;
	private String mem_cd;
	private String buydate;
	private int amount;
	private int discount;
	private int pricesum;
	private int mem_coupon_no;
	private int use_point;
}
