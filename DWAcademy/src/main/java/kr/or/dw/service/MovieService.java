package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.dw.command.MovieViewerCommand;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.MoviePictureVO;
import kr.or.dw.vo.MoviePreviewVO;
import kr.or.dw.vo.ReviewVO;


public interface MovieService {

	/**
	 * 영화예매순으로 10개 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> getIndexBoxOfficeMovie10() throws SQLException;

	/**
	 * 영화 상세페이지 메서드
	 * @param movie_cd
	 * @return
	 */
	MovieViewerCommand getMovieView(String movie_cd) throws SQLException;

	/**
	 * 전체 영화 검색타입, 키워드에 따라 가져오는 메서드
	 * @param searchType
	 * @param keyword
	 * @return
	 */
	List<Map<String, Object>> searchAllMovieList(String searchType, String keyword) throws SQLException;

	/**
	 * 현재 상영영화 검색타입, 키워드에따라 가져오는 메서드
	 * @param searchType
	 * @param keyword
	 * @return
	 */
	List<Map<String, Object>> searchScreenMovieList(String searchType, String keyword) throws SQLException;

	/**
	 * 상영예정 영화 검색타입, 키워드에 따라 가져오는 메서드
	 * @param searchType
	 * @param keyword
	 * @return
	 */
	List<Map<String, Object>> searchComingMovieList(String searchType, String keyword) throws SQLException;

	/**
	 * 영화 좋아요 누르는 메서드
	 * @param movie_cd
	 * @param mem_cd
	 * @return
	 */
	String clickMovieLike(String movie_cd, String mem_cd) throws SQLException;

	/**
	 * 영화 좋아요 수 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	int getMoiveLikeCount(String movie_cd) throws SQLException;

	/**
	 * 회원이 영화 좋아요를 눌렀는지 안눌렀는지 확인하는 메서드
	 * @param mem_cd
	 * @param movie_cd
	 * @return
	 */
	int memLikeMovieExist(String mem_cd, String movie_cd) throws SQLException;

	/**
	 * 영화의 누적 관객수, 예매율 구하는메서드
	 * @param movie_cd
	 * @return
	 */
	Map<String, Integer> getMovieReserve(String movie_cd) throws SQLException;

	/**
	 * 회원이 해당 영화를 봤는지 안봤는지 확인하는 메세ㅓ드
	 * @param mem_cd
	 * @param movie_cd
	 * @return
	 */
	String getMovieWatchYN(String mem_cd, String movie_cd) throws SQLException;

	/**
	 * 리뷰작성하는 메서드
	 * @param review
	 * @throws SQLException
	 */
	void registReview(ReviewVO review) throws SQLException;

	/**
	 * 영화 리뷰 3개 가져오는 메서드
	 * @param movie_cd
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> getMovieReview3(String movie_cd, HttpSession session) throws SQLException;

	/**
	 * 리뷰 좋아요 누르는 메서드
	 * @param review_no
	 * @param mem_cd
	 */
	void reviewLike(String review_no, String mem_cd) throws SQLException;
	
	/**
	 * 리뷰 좋아요 취소하는 메서드
	 * @param review_no
	 * @param mem_cd
	 */
	void reviewLikeDel(String review_no, String mem_cd) throws SQLException;

	/**
	 * 영화 리뷰 신고하는 메서드
	 * @param review_no
	 * @param mem_cd
	 * @return 
	 */
	String reviewReport(int review_no, String mem_cd) throws SQLException;

	/**
	 * 리뷰 수정하는 메서드
	 * @param review
	 */
	void updateReview(ReviewVO review) throws SQLException;

	/**
	 * 회원 선호 장르 가져오는 메서드
	 * @param mem_cd
	 * @return
	 */
	List<String> getMemLikeGenre(String mem_cd) throws SQLException;

	/**
	 * 회원 선호 장르에 따른 영화 리스트 가져오는 메서드
	 * @param searchType
	 * @param keyword
	 * @param memLikeGenreList
	 * @return
	 */
	List<Map<String, Object>> searchLikeGenreMovieList(String searchType, String keyword,
			List<String> memLikeGenreList) throws SQLException;

	/**
	 * 모든 영화의 리뷰를 가져오는 메서드
	 * @return
	 */
	List<Map<String, Object>> getAllMovieReview(HttpSession session) throws SQLException;
	 /** 영화 예고편 목록 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	List<MoviePreviewVO> getMoviePreview(String movie_cd) throws SQLException;

	/**
	 * 영화 사진 목록 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	List<MoviePictureVO> getMoviePicture(String movie_cd) throws SQLException;

	/**
	 * 해당 영화 평균 평점 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	double getMovieRateAvg(String movie_cd) throws SQLException;

	/**
	 * 리뷰를 검색하는 메서드
	 * @param searchReview
	 * @return
	 */
	List<Map<String, Object>> searchReview(String keyword, HttpSession session) throws SQLException;

}
