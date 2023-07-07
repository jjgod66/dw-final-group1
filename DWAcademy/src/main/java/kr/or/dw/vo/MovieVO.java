package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MovieVO {

	private String movie_cd;
	private String movie_name;
	private String movie_info;
	private String movie_director;
	private String movie_actor;
	private String movie_grade;
	private int movie_length;
	private String movie_mainpic_path;
	private Date opendate;
	private Date enddate;
}
