package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.MoviePictureVO;
import kr.or.dw.vo.MoviePostVO;
import kr.or.dw.vo.MoviePreviewVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ReplyVO;
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
	List<Map<String, Object>> selectReview3(String movie_cd) throws SQLException;

	/**
	 * 리뷰 종아요 누르는 메서드
	 * @param param
	 */
	void insertReviewLike(Map<String, String> param) throws SQLException;

	/**
	 * 리뷰 좋아요 취소하는 메서드
	 * @param param
	 */
	void deleteReviewLike(Map<String, String> param) throws SQLException;

	/**
	 * 회원이 해당 리뷰에 좋아요를 남겼는지 안남겼는지 확인하는 메서드
	 * @param param
	 * @return
	 */
	int selectReviewLikeYN(Map<String, Object> param) throws SQLException;

	/**
	 * 회원이 영화리뷰를 신고했는지 안했는지 확인하는 메서드
	 * @param param
	 * @return
	 */
	int reviewReportYN(Map<String, Object> param) throws SQLException;

	/**
	 * 영화리뷰 신고하는 메서드
	 * @param param
	 */
	void insertReviewReport(Map<String, Object> param) throws SQLException;

	/**
	 * 영화리뷰 수정하는 메서드
	 * @param review
	 * @throws SQLException
	 */
	void updateReview(ReviewVO review) throws SQLException;

	/**
	 * 회원 선호 장르 가져오는 메서드
	 * @param mem_cd
	 * @return
	 */
	List<String> selectMemLikeGenre(String mem_cd) throws SQLException;

	/**
	 * 회원 선호 장르에 해당하는 영화 목록 가져오는 메서드
	 * @param param
	 * @return
	 */
	List<Map<String, Object>> selectLikeGenreMovie(Map<String, String> param) throws SQLException;
	
	/**
	 * 모든 영화의 리뷰를 가져오는 메서드
	 * @param rowBounds 
	 * @param cri 
	 * @return
	 */
	List<Map<String, Object>> getAllMovieReview(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	/**
	 * 영화 평균 평점 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	double selectMovieRateAvg(String movie_cd) throws SQLException;

	/**
	 * 리뷰를 검색하는 메서드
	 * @param searchReview
	 * @return
	 */
	List<Map<String, Object>> searchReview(String keyword) throws SQLException;
	
	/** 해당 영화의 무비포스트 맵으로 가져오는 메서드
	 * @param movie_cd
	 * @return
	 */
	List<Map<String, Object>> selectMoviePostMap(String movie_cd) throws SQLException;

	/**
	 * 무비포스트 가져오는 메서드
	 * @param cri
	 * @param rowBounds
	 * @return
	 */
	List<Map<String, Object>> selectSearchMoviePostList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	/**
	 * 무비포스트 갯수 
	 * @param cri
	 * @return
	 * @throws SQLException
	 */
	int selectSearchMoviePostcnt(SearchCriteria cri) throws SQLException;

	/**
	 * 리뷰의 갯수
	 * @param cri
	 * @return
	 */
	int getSearchReviewListCount(SearchCriteria cri) throws SQLException;

	/**
	 * 영화 코드를 가져오는 메서드
	 * @param mem_cd 
	 * @return
	 */
	List<MovieVO> selectMovieCode(String mem_cd) throws SQLException;

	/**
	 * 마이페이지 예매 정보를 가져오는 메서드
	 * @param rowBounds 
	 * @param cri 
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> selectMovieInfoList(SearchCriteria cri, RowBounds rowBounds, @Param("mem_cd")String mem_cd) throws SQLException;

	/**
	 * 무비포스트 작성 메서드
	 * @param moviePost
	 * @throws SQLException
	 */
	void insertMoviePost(MoviePostVO moviePost) throws SQLException;

	/**
	 * 무비포스트 조회
	 * @param mpost_no
	 * @return
	 */
	Map<String, Object> selectMoviePostView(int mpost_no) throws SQLException;

	/**
	 * 무비포스트 댓글 리스트 가져오는 메서드
	 * @param mpost_no
	 * @return
	 */
	List<Map<String, Object>> selectMoviePostReply(int mpost_no) throws SQLException;

	/**
	 * 로그인한 회원이 해당 무비포스트 좋아요를 눌렀는지 안눌렀는지 확인하는 메서드
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	int selectMemMpostLikeYN(Map<String, Object> param) throws SQLException;

	/**
	 * 댓글 작성
	 * @param reply
	 */
	void insertReply(ReplyVO reply) throws SQLException;

	/**
	 * 댓글 작성 후 작성한 댓글 정보 가져오는 메서드
	 * @param reply_no
	 * @return
	 */
	Map<String, Object> selectRegReply(int reply_no) throws SQLException;

	/**
	 * 무비포스트 좋아요
	 * @param param
	 */
	void insertMoviePostLike(Map<String, Object> param) throws SQLException;

	/**
	 * 무비포스트 좋아요 취소
	 * @param param
	 */
	void deleteMoviePostLike(Map<String, Object> param) throws SQLException;

	/**
	 * 댓글 수정
	 * @param param
	 */
	void updateReply(Map<String, Object> param) throws SQLException;

	/**
	 * 댓글 삭제
	 * @param reply_no
	 * @throws SQLException
	 */
	void deleteReply(int reply_no) throws SQLException;

	/**
	 * 회원이 해당 댓글을 신고했는지 안했는지 확인하는 메서드
	 * @param param
	 * @return
	 */
	int getMemReplyReportYN(Map<String, Object> param) throws SQLException;

	/**
	 * 댓글 신고
	 * @param param
	 */
	void replyReport(Map<String, Object> param) throws SQLException;

	/**
	 * 회원이 해당 무비포스트를 신고했는지 안했는지 확인
	 * @param param
	 * @return
	 */
	int getMemMpostReportYN(Map<String, Object> param) throws SQLException;

	/**
	 * 무비포스트 신고
	 * @param param
	 */
	void mpostReport(Map<String, Object> param) throws SQLException;

	/**
	 * 무비포스트 삭제
	 * @param mpost_no
	 */
	void deleteMpost(int mpost_no) throws SQLException;

	/**
	 * 무비포스트 수정할 때 필요한 정보 가져오는 메서드
	 * @param mpost_no
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> selectMoviePostUpdateInfo(int mpost_no) throws SQLException;

	/**
	 * 무비포스트 수정
	 * @param moviePost
	 */
	void updateMoviePost(MoviePostVO moviePost) throws SQLException;

	/**
	 * 무비포스트 작성한 영화 제목과 코드 가져오는 메서드
	 * @param mem_cd
	 * @return
	 */
	List<MovieVO> selectMpostWriteMovie(String mem_cd) throws SQLException;

	/**
	 * 무비포스트 작성 탑5 영화 가져오는 메서드
	 * @return
	 */
	List<Map<String, Object>> selectMpostTop5() throws SQLException;

	/**
	 * 예매 내역 조회
	 * @param mem_cd
	 * @param searchVal
	 * @return
	 */
	List<Map<String, Object>> searchMovieInfoList(@Param("cri")SearchCriteria cri, RowBounds rowBounds, @Param("mem_cd") String mem_cd) throws SQLException;

	/**
	 * 예매 내역의 모든 카운트
	 * @param cri
	 * @param mem_cd 
	 * @return
	 */
	int selectSearchMovieInfoListCnt(SearchCriteria cri, @Param("mem_cd")String mem_cd) throws SQLException;

	/**
	 * 예매 내역의 검색한 카운트
	 * @param cri
	 * @param mem_cd
	 * @return
	 */
	int SearchMovieInfoListCnt(@Param("cri")SearchCriteria cri, @Param("mem_cd") String mem_cd) throws SQLException;

	/**
	 * 리뷰 작성 탑5
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> selectReviewTop5Movie() throws SQLException;

	/**
	 * 나의 예매정보 2개 가져오기
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> getMy2ResInfo(String mem_cd) throws SQLException;

	/**
	 * 리뷰 삭제
	 * @param review_no
	 * @throws SQLException
	 */
	void deleteReview(int review_no) throws SQLException;

	/**
	 * 나의 무비스토리 가져오기
	 * @param cri
	 * @param rowBounds
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> getMyMoviepost(@Param("cri")SearchCriteria cri, RowBounds rowBounds, @Param("mem_cd")String mem_cd);

	/**
	 * 나의 무비스토리 총 개수
	 * @param mem_cd
	 * @return
	 */
	int getMyMoviepostCount(String mem_cd) throws SQLException;

	/**
	 * 나의 무비스토리 검색
	 * @param cri
	 * @param rowBounds
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> searchMyMoviepost(@Param("cri")SearchCriteria cri, RowBounds rowBounds,@Param("mem_cd")String mem_cd);

	/**
	 * 나의 무비스토리 검색 총 개수
	 * @param cri
	 * @param mem_cd 
	 * @return
	 */
	int getSearchMyMoviepostCount(@Param("cri")SearchCriteria cri, @Param("mem_cd")String mem_cd) throws SQLException;

	/**
	 * 나의 리뷰 가져오기
	 * @param cri
	 * @param rowBounds
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> getMyReview(@Param("cri")SearchCriteria cri, RowBounds rowBounds,@Param("mem_cd") String mem_cd) throws SQLException;

	/**
	 * 나의 리뷰 총 개수
	 * @param cri 
	 * @param mem_cd
	 * @return
	 */
	int getMyReviewCount(@Param("cri")SearchCriteria cri, @Param("mem_cd")String mem_cd) throws SQLException;

	/**
	 * 나의 리뷰 검색
	 * @param cri
	 * @param rowBounds
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> searchMyReview(@Param("cri")SearchCriteria cri, RowBounds rowBounds, @Param("mem_cd")String mem_cd) throws SQLException;
	
	/**
	 * 나의 리뷰 검색 총 개수
	 * @param cri
	 * @param mem_cd
	 * @return
	 */
	int searchMyReviewCount(@Param("cri")SearchCriteria cri, @Param("mem_cd")String mem_cd) throws SQLException;

	/**
	 * 내가 좋아요한 영화 가져오기
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> getMyLikeMovie(String mem_cd) throws SQLException;

	/**
	 * 나의 예매 정보
	 * @param mem_cd
	 * @return
	 */
	List<Map<String, Object>> getMybookingList(String mem_cd) throws SQLException;



}
