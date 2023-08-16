package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CouponVO {
	private String coupon_cd;
	private String coupon_name;
	private String discount;
	private int coupon_period;
	private int mem_coupon_no;
	private String mem_cd;
	private Date enddate;
	private String gb_use;
	private int rownum;
}
