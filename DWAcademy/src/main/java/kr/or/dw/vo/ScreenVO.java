package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ScreenVO {

	private String screen_cd;
	private int house_no;
	private String movie_cd;
	private Date startdate;
	private String gb_jojo;
	
	public ScreenVO(String screen_cd, int house_no, String movie_cd, Date startdate, String gb_jojo) {
		this.screen_cd = screen_cd;
		this.house_no = house_no;
		this.movie_cd = movie_cd;
		this.startdate = startdate;
		this.gb_jojo = gb_jojo;
	}
	
	
}
