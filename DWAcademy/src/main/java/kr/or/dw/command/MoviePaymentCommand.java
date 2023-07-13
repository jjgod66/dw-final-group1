package kr.or.dw.command;

import java.util.Map;

import lombok.Data;

@Data
public class MoviePaymentCommand {
	private String screen_cd;
	private int adultSeat;
	private int teenSeat;
	private int preferSeat;
	private String res_seats;
	private int totalPrice;
}
