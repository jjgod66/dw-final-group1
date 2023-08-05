package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.AdminVO;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.FaqVO;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.QnaVO;
import kr.or.dw.vo.TheaterVO;
import kr.or.dw.vo.WinnerBoardVO;


@Mapper
public interface SysAdminDAO {
	
	// 해당하는 극장 목록을 불러온다.
	List<TheaterVO> selectSearchTheaterList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 극장의 총 개수를 불러온다.
	int selectSearchTheaterListCount(SearchCriteria cri) throws SQLException;

	// 지역 리스트 불러오기
	List<String> selectLocList() throws SQLException;

	// 새 지점 등록
	void insertTheater(TheaterVO thr) throws SQLException;
	
	// 새 관리자 등록
	void insertAdmin(AdminVO adminVO) throws SQLException;

	// 지점명으로 해당 지점 불러오기
	TheaterVO selectTheaterByName(String thr_name) throws SQLException;

	// 지점 관리자 아이디/패스워드 수정
	void updateAdmin(AdminVO adminVO) throws SQLException;

	// 해당 극장 지점 정보 수정
	void updateTheater(TheaterVO thr) throws SQLException;

	// 해당 지점 삭제(비활성화)
	void updateDelTheater(TheaterVO thr) throws SQLException;

	// 장르 리스트 불러오기
	List<GenreVO> selectGenreList() throws SQLException;

	// 상영등급 리스트 불러오기
	List<String> selectGradeList() throws SQLException;

	// 영화정보 등록하기
	void insertMovie(MovieVO movie) throws SQLException;

	// 해당 영화 장르 등록하기
	void insertGenre_c(Map<String, String> map) throws SQLException;

	// 해당 영화 타입 등록하기
	void insertMovieType_c(Map<String, String> map) throws SQLException;

	// 해당 영화 관련 사진 등록하기
	void insertMoviePic(Map<String, String> map) throws SQLException;
	
	// 해당 영화 예고편 등록하기
	void insertMoviePre(Map<String, String> map) throws SQLException;

	// 해당하는 영화 목록을 불러온다.
	List<Map<String, Object>> selectSearchMovieList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 영화의 총 개수를 불러온다.
	int selectSearchMovieListCount(SearchCriteria cri) throws SQLException;

	// 해당 영화 정보 불러오기
	Map<String, Object> selectMovieByMovie_cd(String movie_cd) throws SQLException;

	// 해당 영화 장르 불러오기
	List<String> selectGenreByMovie_cd(String movie_cd) throws SQLException;

	// 해당 영화 예매율 불러오기
	double selectReservRatio(String movie_cd) throws SQLException;

	// 해당 영화 타입 불러오기
	List<String> selectTypeByMovie_cd(String movie_cd) throws SQLException;

	// 해당 영화 관련 이미지 불러오기
	List<Map<String, Object>> selectMoiveImgByMovie_cd(String movie_cd) throws SQLException;

	// 해당 영화 기본 정보 수정하기
	void updateMovie(MovieVO movie) throws SQLException;
	
	// 해당 영화 기존 장르 지우기
	void deleteMovieGenre_c(String movie_cd) throws SQLException;

	// 해당 영화 기존 타입 지우기
	void deleteMovieType_c(String movie_cd) throws SQLException;
	
	// 해당 영화의 삭제할 사진 이름 불러오기
	String selectMovieDelImgByPno(int pno) throws SQLException;
	
	// 해당 영화의 선택한 삭제사진 삭제하기
	void deleteMovieImg(int pno) throws SQLException;

	// 해당 영화의 선택한 삭제사진 삭제하기
	String selectMovieDelVideoByPno(int pno) throws SQLException;
	
	// 해당 영화의 선택한 삭제예고편 삭제하기
	void deleteMovieVideo(int pno) throws SQLException;

	// 해당 영화의 이미 올라간 비디오 불러오기
	List<Map<String, Object>> selectMoiveVideoByMovie_cd(String movie_cd) throws SQLException;

	// 새 스토어 상품 등록하기
	void insertProduct(ProductVO product) throws SQLException;

	// 스토어 상품 수정하기
	void updateProduct(ProductVO product) throws SQLException;
	
	// 공지사항 게시글 목록 불러오기
	List<NoticeVO> selectNoticeList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 공지사항게시글의 총 개수를 불러온다.
	int selectSearchNoticeListCount(SearchCriteria cri) throws SQLException;

	// 해당 공지사항 게시글 불러오기
	NoticeVO selectNoticeByNotice_no(int notice_no) throws SQLException;

	// 공지사항 등록하기
	void insertNotice(NoticeVO notice) throws SQLException;

	// 공지사항 수정하기
	void updateNotice(NoticeVO notice) throws SQLException;

	// 공지사항 수정하기
	void deleteNotice(NoticeVO notice) throws SQLException;

	// faq 게시글 목록 불러오기
	List<FaqVO> selectFaqList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 faq게시글의 총 개수를 불러온다.
	int selectSearchFaqListCount(SearchCriteria cri) throws SQLException;

	// FAQ 게시글 수정하기
	void updateFaq(FaqVO faq) throws SQLException;

	// FAQ 게시글 삭제하기
	void deleteFaq(FaqVO faq) throws SQLException;

	// FAQ 게시글 등록하기
	void insertFaq(FaqVO faq) throws SQLException;

	// 1:1문의 게시글 목록 불러오기
	List<QnaVO> selectQnaList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 1:1문의 게시글의 총 개수를 불러온다.
	int selectSearchQnaListCount(SearchCriteria cri) throws SQLException;

	// 해당 1:1문의 게시글 불러오기
	QnaVO selectQnaByQue_no(int que_no) throws SQLException;

	// 해당 1:1문의 게시글 답변 불러오기
	AnswerVO selectAnsByQue_no(int que_no) throws SQLException;

	// 해당 1:1문의 게시글의 답변 등록하기
	void insertAns(AnswerVO ans) throws SQLException;

	// 해당 1:1문의 게시글의 답변 수정하기
	void updateAns(AnswerVO ans) throws SQLException;

	// 이벤트 게시글 목록 불러오기
	List<EventVO> selectEventList(SearchCriteria cri) throws SQLException;

	// 해당하는 이벤트 게시글의 총 개수를 불러온다.
	int selectSearchEventListCount(SearchCriteria cri) throws SQLException;

	// 영화관련 진행중 이벤트 4개를 불러온다.
	List<EventVO> selectmovEventList() throws SQLException;

	// 영화관관련 진행중 이벤트 4개를 불러온다.
	List<EventVO> selectThrEventList() throws SQLException;

	// 시사회/무대인사관련 진행중 이벤트 4개를 불러온다.
	List<EventVO> selectactorEventList() throws SQLException;

	// 이벤트 등록하기
	void insertEvent(EventVO event) throws SQLException;

	// 해당하는 이벤트 게시글 조회
	EventVO selectEventByEvent_no(int event_no) throws SQLException;

	// 이벤트 게시글 이미지 경로 수정
	void updateEventContent(Map<String, Object> modifyEventContentMap) throws SQLException;

	// 해당하는 이벤트 게시글 수정
	void updateEvent(EventVO event) throws SQLException;

	// 해당하는 이벤트 게시글 삭제
	void deleteEvent(int event_no) throws SQLException;

	// 지난 이벤트 게시글 목록 불러오기
	List<EventVO> selectEventListforPast(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 지난 이벤트 게시글 총 수 불러오기
	int selectEventListforPastCount(SearchCriteria cri) throws SQLException;

	// 당첨자발표 게시글 등록하기
	void insertWinnerBoard(WinnerBoardVO wb) throws SQLException;

	// 해당 당첨자발표 게시글 조회
	WinnerBoardVO selectWbByEvent_no(int event_no) throws SQLException;

	// 해당 당첨자발표 게시글 수정
	void updateWinnerBoard(WinnerBoardVO wb) throws SQLException;

	// 해당 당첨자발표 게시글 삭제
	void deleteWinnerBoard(WinnerBoardVO wb) throws SQLException;

	// 메인용 공지사항 게시글 목록가져오기
	List<NoticeVO> selectNoticeForMain() throws SQLException;

	// 메인용 1:1문의 게시글 목록 가져오기
	List<QnaVO> selectQnaForMain() throws SQLException;

	// 메인용 1:1문의 게시글 목록 가져오기
	List<EventVO> selectEventForMainPage() throws SQLException;

	// 메인용 상영영화 목록 가져오기
	List<MovieVO> selectCurrentMovieForMain() throws SQLException;

	// 가입된 회원 목록 가져오기
	List<MemberVO> selectMemberList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 가입된 회원 목록 총 수 가져오기
	int selectMemberListCount(SearchCriteria cri) throws SQLException;

	// 회원 상세페이지를 위한 회원 정보 가져오기
	Map<String, Object> selectMemberByMem_cd(String mem_cd) throws SQLException;


	// 회원이 지금까지 본 영화 정보 조회하기 5개만
	List<Map<String, Object>> selectWatchedMoviePreviewListByMem_cd(String mem_cd) throws SQLException;

	// 회원이 지금까지 작성한 리뷰글 5개만
	List<Map<String, Object>> selectReviewPreviewListByMem_cd(String mem_cd) throws SQLException;

	// 회원이 지금까지 작성한 무비포스트 5개만
	List<Map<String, Object>> selectMpPreviewListByMem_cd(String mem_cd) throws SQLException;

	// 회원이 지금까지 작성한 무비포스트 댓글 5개만
	List<Map<String, Object>> selectMpReplyPreviewListByMem_cd(String mem_cd) throws SQLException;

	// 회원이 지금까지 본 영화 정보 조회하기
	List<Map<String, Object>> selectWatchedMovieListByMem_cd(String mem_cd) throws SQLException;
	
	// 회원이 지금까지 작성한 리뷰 조회
	List<Map<String, Object>> selectReviewListByMem_cd(String mem_cd) throws SQLException;
	
	// 회원이 작성한 무비포스트 조회
	List<Map<String, Object>> selectMpListByMem_cd(String mem_cd) throws SQLException;

	// 회원이 작성한 무비포스트 댓글 조회
	List<Map<String, Object>> selectMpReplyListByMem_cd(String mem_cd) throws SQLException;

	// 해당 회원 정지
	void banMember(String mem_cd) throws SQLException; 

	// 해당 회원 정지 해제
	void cancelBanMember(String mem_cd) throws SQLException;

	// 이벤트 등록을 위한 영화목록을 가져온다.
	List<Map<String, Object>> selectMovieListForEventRegist() throws SQLException;

	// 비활성화 했던 극장을 다시 활성화
	void updateUndelTheater(TheaterVO thr) throws SQLException;
	
}
