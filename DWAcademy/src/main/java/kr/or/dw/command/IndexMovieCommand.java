package kr.or.dw.command;

import java.util.Date;
import java.util.Map;

import lombok.Data;

@Data
public class IndexMovieCommand {

	private String movie_cd;
	private String movie_name;
	private String movie_grade;
	private int movie_length;
	private String movie_mainpic_path;
	private Date opendate;
	private int reservers;
	
	public IndexMovieCommand(Map<String, Object> movieMap) {

		this.movie_cd = (String) movieMap.get("MOVIE_CD");
		this.movie_name = (String) movieMap.get("MOVIE_NAME");
		this.movie_grade = (String) movieMap.get("MOVIE_GRADE");
		this.movie_length = Integer.parseInt(String.valueOf(movieMap.get("MOVIE_LENGTH")));
		this.movie_mainpic_path = (String) movieMap.get("MOVIE_MAINPIC_PATH");
		this.opendate = (Date) movieMap.get("OPENDATE");
		this.reservers = Integer.parseInt(String.valueOf(movieMap.get("RESERVERS")));
	}

	public IndexMovieCommand(String movie_cd, String movie_name, String movie_grade, int movie_length,
			String movie_mainpic_path, Date opendate, int reservers) {
		super();
		this.movie_cd = movie_cd;
		this.movie_name = movie_name;
		this.movie_grade = movie_grade;
		this.movie_length = movie_length;
		this.movie_mainpic_path = movie_mainpic_path;
		this.opendate = opendate;
		this.reservers = reservers;
	}
	
	public IndexMovieCommand() {}
	
	
}
