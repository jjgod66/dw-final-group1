package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReservationVO {

	private String merchant_uid;
	private String res_no;
	private String mem_cd;
	private String screen_cd;
	private String mem_cat;
	private String res_seat;
	private Date resdate;
	private int discount;
	private int pricesum;
	private int mem_coupon_no;
	private int use_point;
}
