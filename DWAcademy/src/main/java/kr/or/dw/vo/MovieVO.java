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
	
	public MovieVO(String movie_cd, String movie_name, String movie_info, String movie_director, String movie_actor,
			String movie_grade, int movie_length, String movie_mainpic_path, Date opendate, Date enddate) {
		this.movie_cd = movie_cd;
		this.movie_name = movie_name;
		this.movie_info = movie_info;
		this.movie_director = movie_director;
		this.movie_actor = movie_actor;
		this.movie_grade = movie_grade;
		this.movie_length = movie_length;
		this.movie_mainpic_path = movie_mainpic_path;
		this.opendate = opendate;
		this.enddate = enddate;
	}
	
	
}
