package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReservationVO {

	private String res_cd;
	private int res_no;
	private String mem_cd;
	private String screen_cd;
	private String mem_cat;
	private String res_seat;
	private Date resdate;
}
