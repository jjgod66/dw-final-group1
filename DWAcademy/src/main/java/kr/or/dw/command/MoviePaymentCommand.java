package kr.or.dw.command;


import lombok.Data;

@Data
public class MoviePaymentCommand {
	private String screen_cd;
	private int adultSeat;
	private int teenSeat;
	private int preferSeat;
	private String res_seats;
	private int pricesum;
	private String json;
	private int discount;
	private int mem_coupon_no;
	private int use_point;
	private String merchant_uid;
	
	
}
