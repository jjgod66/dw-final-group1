package kr.or.dw.command;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import kr.or.dw.vo.MovieVO;
import lombok.Data;

@Data
public class MovieModifyCommand {
	
	private String movie_cd;
	private String movie_name;
	private String movie_director;
	private MultipartFile movie_mainPic_path;
	private String oldPicture;
	private int movie_length;
	private String movie_info;
	private String movie_actor;
	private String movie_grade;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date opendate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date enddate;
	private String[] genre_cd;
	private List<MultipartFile> uploadImg;
	private List<MultipartFile> uploadVideo;
	private String[] isdub;
	private String[] is3d;
	private int[] deleteImg;
	private int[] deleteVideo;
	
	public MovieVO toParseMovie() {
		MovieVO movie = new MovieVO();
		movie.setMovie_cd(movie_cd);
		movie.setMovie_name(movie_name);
		movie.setMovie_info(movie_info);
		movie.setMovie_director(movie_director);
		movie.setMovie_actor(movie_actor);
		movie.setMovie_grade(movie_grade);
		movie.setMovie_length(movie_length);
		movie.setOpendate(opendate);
		movie.setEnddate(enddate);
		movie.setMovie_mainpic_path(movie_mainPic_path.getOriginalFilename());
		return movie;
		
	}
}
