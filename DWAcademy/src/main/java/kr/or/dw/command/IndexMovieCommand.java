package kr.or.dw.command;

import java.util.Date;

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
}
