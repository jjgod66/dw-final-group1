package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
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

	@Override
	public List<Map<String, Object>> searchAllMovieList(String searchType, String keyword) throws SQLException {
		List<Map<String, Object>> movieList = null;
		Map<String, String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("keyword", keyword);
		movieList = movieDAO.selectSearchAllMovie(param);
		
		int yes_all_reserver = movieDAO.selectYesAllReserver();
		for(Map<String, Object> movie : movieList) {
			movie.put("all_reserver", yes_all_reserver);
		}
		
		return movieList;
	}

	@Override
	public List<Map<String, Object>> searchScreenMovieList(String searchType, String keyword) throws SQLException {
		List<Map<String, Object>> movieList = null;
		Map<String, String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("keyword", keyword);
		movieList = movieDAO.selectSearchScreenMovie(param);
		
		int yes_all_reserver = movieDAO.selectYesAllReserver();
		for(Map<String, Object> movie : movieList) {
			movie.put("all_reserver", yes_all_reserver);
		}
		
		return movieList;
	}

	@Override
	public List<Map<String, Object>> searchComingMovieList(String searchType, String keyword) throws SQLException {
		List<Map<String, Object>> movieList = null;
		Map<String, String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("keyword", keyword);
		movieList = movieDAO.selectSearchComingMovie(param);
		
		int yes_all_reserver = movieDAO.selectYesAllReserver();
		for(Map<String, Object> movie : movieList) {
			movie.put("all_reserver", yes_all_reserver);
		}
		
		return movieList;
	}

	@Override
	public String clickMovieLike(String movie_cd, String mem_cd) throws SQLException {
		String result = null;
		
		Map<String, String> param = new HashMap<>();
		param.put("movie_cd", movie_cd);
		param.put("mem_cd", mem_cd);
		
		int exist = 0;
		exist = movieDAO.selectMovieLikeExist(param);
		
		if(exist == 0) {
			movieDAO.insertMovieLike(param);
			result = "insert";
		}else {
			movieDAO.deleteMovieLike(param);
			result = "delete";
		}
		
		return result;
	}

	@Override
	public int getMoiveLikeCount(String movie_cd) throws SQLException {
		int count = 0;
		count = movieDAO.selectMovieLikeCount(movie_cd);
		
		return count;
	}

	@Override
	public int memLikeMovieExist(String mem_cd, String movie_cd) throws SQLException {
		Map<String, String> param = new HashMap<>();
		param.put("movie_cd", movie_cd);
		param.put("mem_cd", mem_cd);
		
		int exist = 0;
		exist = movieDAO.selectMovieLikeExist(param);
		return exist;
	}

	@Override
	public Map<String, Integer> getMovieReserve(String movie_cd) throws SQLException {
		Map<String, Integer> reserMap = new HashMap<>();
		
		int all_reservers = movieDAO.selectMovieAllReservers(movie_cd);
		
		int yes_all_reservers = movieDAO.selectYesAllReserver();
		
		int yes_movie_reservers = movieDAO.selectYesMovieReserver(movie_cd);
		
		reserMap.put("all_reservers", all_reservers);
		reserMap.put("yes_all_reservers", yes_all_reservers);
		reserMap.put("yes_movie_reservers", yes_movie_reservers);
		
		return reserMap;
	}

	@Override
	public String getMovieWatchYN(String mem_cd, String movie_cd) throws SQLException {
		Map<String, String> param = new HashMap<>();
		param.put("mem_cd", mem_cd);
		param.put("movie_cd", movie_cd);
		
		String result = "non";
		int count = 0;
		count = movieDAO.selectMovieWatchYN(param);
		
		int review = 0;
		if(count > 0) {
			result = "watch";
			review = movieDAO.selectMovieReviewYN(param);
		}
		
		if(review > 0) {
			result = "write";
		}
		return result;
	}

	@Override
	public void registReview(ReviewVO review) throws SQLException {

		movieDAO.insertReview(review);
	}

	@Override
	public List<ReviewVO> getMovieReview3(String movie_cd) throws SQLException {
		List<ReviewVO> reviewList = null;
		reviewList = movieDAO.selectReview3(movie_cd);
		
		return reviewList;
	}

}
