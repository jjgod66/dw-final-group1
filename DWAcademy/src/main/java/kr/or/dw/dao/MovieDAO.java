package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.MoviePictureVO;
import kr.or.dw.vo.MoviePostVO;
import kr.or.dw.vo.MoviePreviewVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ReviewVO;

@Mapper
public interface MovieDAO {

	/**
	 * 영화예매순으로 10개 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> selectBoxOfficeMovie10() throws SQLException;

	/**
	 * 영화코드로 영화VO가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	MovieVO selectMovieDetail(String movie_cd) throws SQLException;

	/**
	 * 영화 코드로 영화관련사진 리스트 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	List<MoviePictureVO> selectMoviePicture(String movie_cd) throws SQLException;

	/**
	 * 영화코드로 영화예고편 리스트 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	List<MoviePreviewVO> selectMoviePreview(String movie_cd) throws SQLException;

	/**
	 * 영화코드로 무비포스트 리스트 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	List<MoviePostVO> selectMoviePostByCd(String movie_cd) throws SQLException;

	/**
	 * 영화코드로 관람평 리스트 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	List<ReviewVO> selectReviewByCd(String movie_cd) throws SQLException;

	/**
	 * 영화코드로 영화 타입 리스트 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	String[] selectMovieTypeByCd(String movie_cd);

	/**
	 * 영화코드로 영화 장르 리스트 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	String[] selectMovieGenreByCd(String movie_cd);

}
