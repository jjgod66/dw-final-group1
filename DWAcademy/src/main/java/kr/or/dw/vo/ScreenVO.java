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
}
