package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ClickMovieInfoVO {
	
	private String THR_NAME;
	private String MOVIE_NAME;
	private Date STARTTIME;
	private Date ENDTIME;
	private int MOVIE_LENGTH;
	private String SCREEN_CD;
	private String MOVIE_CD;
	private int HOUSE_NO;
}
