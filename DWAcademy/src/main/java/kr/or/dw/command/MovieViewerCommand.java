package kr.or.dw.command;

import java.util.Date;
import java.util.List;

import kr.or.dw.vo.MoviePictureVO;
import kr.or.dw.vo.MoviePostVO;
import kr.or.dw.vo.MoviePreviewVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ReviewVO;
import lombok.Data;

@Data
public class MovieViewerCommand {

	private MovieVO movie;
	private List<MoviePictureVO> movie_picture_list;
	private List<MoviePreviewVO> movie_preview_list;
	private List<MoviePostVO> moviepost_list;
	private List<ReviewVO> review_list;
	private String[] genre_list;
	private String[] type_list;
	

}
