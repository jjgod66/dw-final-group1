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

//	/**
//	 * 전체 영화 검색타입, 키워드에 따라 가져오는 메서드
//	 * @param searchType
//	 * @param keyword
//	 * @return
//	 */
//	Map<String, Object> selectSearchAllMovie(String searchType, String keyword) throws SQLException;

	/**
	 * 전체 영화 검색타입, 키워드에 따라 가져오는 메서드
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> selectSearchAllMovie(Map<String, String> param) throws SQLException;

	/**
	 * 전날의 모든 예매수 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	int selectYesAllReserver() throws SQLException;

	/**
	 * 현재 상영영화 검색타입, 키워드에따라 가져오는 메서드
	 * @param searchType
	 * @param keyword
	 * @return
	 */
	List<Map<String, Object>> selectSearchScreenMovie(Map<String, String> param) throws SQLException;
	
	/**
	 * 상영예정 영화 검색타입, 키워드에따라 가져오는 메서드
	 * @param searchType
	 * @param keyword
	 * @return
	 */
	List<Map<String, Object>> selectSearchComingMovie(Map<String, String> param) throws SQLException;

	/**
	 * 회원이 해당 영화에 좋아요를 눌렀는지 안눌렀는지 확인하는 메서드
	 * @param param
	 * @return
	 */
	int selectMovieLikeExist(Map<String, String> param) throws SQLException;

	/**
	 * 영화 좋아요 추가하는 메서드
	 * @param param
	 */
	void insertMovieLike(Map<String, String> param) throws SQLException;

	/**
	 * 영화 좋아요 삭제하는 메서드
	 * @param param
	 */
	void deleteMovieLike(Map<String, String> param) throws SQLException;

	/**
	 * 영화의 좋아요 수 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	int selectMovieLikeCount(String movie_cd) throws SQLException;

	/**
	 * 영화의 누적관객수 구하는 메서드
	 * @param movie_cd
	 * @return
	 */
	int selectMovieAllReservers(String movie_cd) throws SQLException;

	/**
	 * 해당 영화 전날 예매수 가져오는 메서드
	 * @param movie_cd
	 * @return
	 * @throws SQLException
	 */
	int selectYesMovieReserver(String movie_cd) throws SQLException;

	/**
	 * 회원이 해당 영화를 봤는지 안봤는지 본 갯수 가져오는 메서드
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	int selectMovieWatchYN(Map<String, String> param) throws SQLException;

	/**
	 * 회원이 리뷰를 달았는지 안달았는지 확인하는 메서드
	 * @param param
	 * @return
	 */
	int selectMovieReviewYN(Map<String, String> param) throws SQLException;

	/**
	 * 리뷰작성하는 메서드
	 * @param review
	 * @throws SQLException
	 */
	void insertReview(ReviewVO review) throws SQLException;

	/**
	 * 리뷰 3개 가져오는 메서드 
	 * @param movie_cd
	 * @return
	 * @throws SQLException
	 */
	List<ReviewVO> selectReview3(String movie_cd) throws SQLException;

}
