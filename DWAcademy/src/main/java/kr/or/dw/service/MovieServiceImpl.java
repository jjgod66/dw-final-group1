package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.MovieViewerCommand;
import kr.or.dw.dao.MovieDAO;
import kr.or.dw.vo.MoviePictureVO;
import kr.or.dw.vo.MoviePostVO;
import kr.or.dw.vo.MoviePreviewVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ReviewVO;

public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	public List<Map<String, Object>> getIndexBoxOfficeMovie10() throws SQLException{
		List<Map<String, Object>> movieList = null;
		
		movieList = movieDAO.selectBoxOfficeMovie10();
		return movieList;
	}

	@Override
	public MovieViewerCommand getMovieView(String movie_cd) throws SQLException {
		MovieVO movie = movieDAO.selectMovieDetail(movie_cd);
		List<MoviePictureVO> movie_picture_list = movieDAO.selectMoviePicture(movie_cd);
		List<MoviePreviewVO> movie_preview_list = movieDAO.selectMoviePreview(movie_cd);
		List<MoviePostVO> moviepost_list = movieDAO.selectMoviePostByCd(movie_cd);
		List<ReviewVO> review_list = movieDAO.selectReviewByCd(movie_cd);
		String[] type_list = movieDAO.selectMovieTypeByCd(movie_cd);
		String[] genre_list = movieDAO.selectMovieGenreByCd(movie_cd);
		
		MovieViewerCommand mvc = new MovieViewerCommand();
		mvc.setMovie(movie);
		mvc.setMovie_picture_list(movie_picture_list);
		mvc.setMovie_preview_list(movie_preview_list);
		mvc.setMoviepost_list(moviepost_list);
		mvc.setReview_list(review_list);
		mvc.setGenre_list(genre_list);
		mvc.setType_list(type_list);
		
		return mvc;
	}

}
