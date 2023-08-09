package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.dw.command.MovieViewerCommand;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ReplyVO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.MoviePictureVO;
import kr.or.dw.vo.MoviePostVO;
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
	Map<String, Object> getAllMovieReview(HttpSession session, SearchCriteria cri) throws SQLException;
	
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
	 
	/** 해당 영화 무비포스트 4개 가져오는 메서드
	 * @param movie_cd 
	 * @return
	 */
	List<Map<String, Object>> getMoviePost4(String movie_cd) throws SQLException;

	/**
	 * 무비포스트 목록 가져오는 메서드
	 * @param cri
	 * @return
	 */
	Map<String, Object> getMoviePost(SearchCriteria cri, HttpSession session) throws SQLException;

	/**
	 * 마이페이지 예매 정보를 가져오는 메서드
	 * @param cri 
	 * @param mem_cd
	 * @return
	 */
	Map<String, Object> selectMovieInfo(SearchCriteria cri, String mem_cd) throws SQLException;

	/**
	 * 무비포스트 작성 메서드
	 * @param moviePost
	 */
	void registMoviePost(MoviePostVO moviePost) throws SQLException;

	/**
	 * 무비포스트 조회
	 * @param mpost_no
	 * @param mem_cd 
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> getMoivePostView(int mpost_no, String mem_cd) throws SQLException;

	/**
	 * 댓글 작성
	 * @param reply_content
	 * @param mpost_no
	 * @param mem_cd
	 * @return
	 */
	Map<String, Object> registReply(ReplyVO reply) throws SQLException;

	/**
	 * 무비포스트 좋아요
	 * @param mpost_no
	 * @param mem_cd
	 */
	void clickMoviePostLike(int mpost_no, String mem_cd) throws SQLException;

	/**
	 * 댓글 수정
	 * @param reply_content
	 * @param reply_no
	 */
	void updateReply(String reply_content, int reply_no) throws SQLException;

	/**
	 * 댓글 삭제
	 * @param reply_no
	 */
	void deleteReply(int reply_no) throws SQLException;

	/**
	 * 댓글 신고
	 * @param reply_no
	 * @param mem_cd
	 * @return 
	 */
	String replyReport(int reply_no, String mem_cd) throws SQLException;

	/**
	 * 무비포스트 신고
	 * @param mpost_no
	 * @param mem_cd
	 * @return
	 */
	String mpostReport(int mpost_no, String mem_cd) throws SQLException;

	/**
	 * 무비포스트 삭제
	 * @param mpost_no
	 */
	void deleteMpost(int mpost_no) throws SQLException;

	/**
	 * 무비포스트 수정하기 위한 정보 가져오는 메서드
	 * @param mpost_no
	 * @return
	 */
	Map<String, Object> getMoivePostUpdateInfo(int mpost_no) throws SQLException;

	/**
	 * 무비포스트 수정
	 * @param moviePost
	 * @throws SQLException
	 */
	void updateMoviePost(MoviePostVO moviePost) throws SQLException;

	/**
	 * 무비포스트 작성 탑5 영화 가져오는 메서드
	 * @return
	 */
	List<Map<String, Object>> getMpostTop5Movie() throws SQLException;

	/**
	 * 예매 내역조회
	 * @param cri 
	 * @param mem_cd
	 * @param searchVal
	 * @return
	 */
	Map<String, Object> searchMovieInfo(SearchCriteria cri, String mem_cd) throws SQLException;
	/**
	 * 구매 내역조회
	 * @param cri 
	 * @param mem_cd
	 * @param searchVal
	 * @return
	 */
	Map<String, Object> searchBuyInfo(SearchCriteria cri, String mem_cd) throws SQLException;

	/**
	 * 리뷰 작성 탑5 영화 가져오는 메서드
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> getReviewTop5Movie() throws SQLException;

	/**
	 * 나의 예매정보 2개 가져오기
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> getMy2ResInfo(String mem_cd) throws SQLException;

	/**
	 * 리뷰 삭제
	 * @param review_no
	 * @return
	 * @throws SQLException
	 */
	String deleteReview(int review_no) throws SQLException;

	/**
	 * 나의 무비스토리 가져오기
	 * @param cri
	 * @param mem_cd
	 * @return
	 */
	Map<String, Object> getMyMoviepost(SearchCriteria cri, String mem_cd) throws SQLException;

	/**
	 * 나의 무비스토리 검색
	 * @param cri
	 * @param mem_cd
	 * @return
	 */
	Map<String, Object> searchMyMoviepost(SearchCriteria cri, String mem_cd) throws SQLException;

	/**
	 * 나의 리뷰 가져오기
	 * @param cri
	 * @param mem_cd
	 * @return
	 */
	Map<String, Object> getMyReview(SearchCriteria cri, String mem_cd) throws SQLException;

	/**
	 * 나의 리뷰 검색
	 * @param cri
	 * @param mem_cd
	 * @return
	 */
	Map<String, Object> searchMyReview(SearchCriteria cri, String mem_cd) throws SQLException;

	/**
	 * 내가 좋아요한 영화 가져오기
	 * @param mem_cd
	 * @return
	 */
	Map<String, Object> getMyLikeMovie(String mem_cd) throws SQLException;

}
