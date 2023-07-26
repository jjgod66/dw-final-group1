package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.MovieRegistCommand;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.FaqVO;
import kr.or.dw.vo.GenreVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.QnaVO;
import kr.or.dw.vo.TheaterVO;
import kr.or.dw.vo.WinnerBoardVO;

public interface SysAdminService {

	/////////////////theater admin////////////////////////
	// 해당 점포리스트 불러오기
	Map<String, Object> selectTheaterList(SearchCriteria cri) throws SQLException;

	// 지역 리스트 불러오기
	List<String> selectLocList() throws SQLException;

	// 새 지점 등록
	void theaterRegist(TheaterVO thr) throws SQLException;

	// 지점명으로 해당 지점 불러오기
	TheaterVO selectTheaterByName(String thr_name) throws SQLException;

	// 해당 지점 정보 수정
	void theaterModify(TheaterVO thr) throws SQLException;

	// 해당 지점 삭제(비활성화)
	void theaterDelete(String thr_name) throws SQLException;

	//////////////movie admin////////////////////////
	// 장르 리스트 불러오기
	List<GenreVO> selectGenreList() throws SQLException;

	// 등급 리스트 불러오기
	List<String> selectGradeList() throws SQLException;

	// 영화정보 등록하기
	void registMovie(MovieVO movie) throws SQLException;

	// 해당 영화 장르 등록하기
	void registMovieGenre_c(String[] genres, String movie_cd) throws SQLException;

	// 해당 영화 타입 등록하기
	void registMovieType_c(List<String> movie_types, String movie_cd) throws SQLException;

	// 해당 영화 관련 사진 등록하기
	void registMoviePic(List<String> movie_pics, String movie_cd) throws SQLException;

	// 해당 영화 예고편 등록하기
	void registMoviePre(List<String> movie_pres, String movie_cd) throws SQLException;

	// 영화 리스트 불러오기
	Map<String, Object> selectMovieList(SearchCriteria cri) throws SQLException;

	// 해당 영화 정보 불러오기
	Map<String, Object> selectMovieByMovie_cd(String movie_cd) throws SQLException;

	// 해당 영화 기본 정보 수정하기
	void modifyMovie(MovieVO movie) throws SQLException;

	// 해당 영화 장르 수정하기
	void modifyMovieGenre_c(String[] genres, String movie_cd) throws SQLException;

	// 해당 영화 타입 수정하기
	void modifyMovieType_c(List<String> movie_types, String movie_cd) throws SQLException;
	
	// 해당 영화의 삭제할 사진 이름 불러오기
	String selectMovieDelImgByPno(int pno) throws SQLException;
	
	// 해당 영화의 선택한 삭제사진 삭제하기
	void deleteMovieImg(int pno) throws SQLException;

	// 해당 영화의 삭제할 예고편 이름 불러오기
	String selectMovieDelVideoByPno(int pno) throws SQLException;

	// 해당 영화의 선택한 삭제예고편 삭제하기
	void deleteMovieVideo(int pno) throws SQLException;

	// 해당 영화의 이미 올라간 비디오 불러오기
	List<Map<String, Object>> selectMoiveVideoByMovie_cd(String movie_cd) throws SQLException;

	// 새 스토어 상품 등록하기
	void registProduct(ProductVO product) throws SQLException;

	// 스토어 상품 수정하기
	void modifyProduct(ProductVO product) throws SQLException;

	// 공지사항 게시글 목록 불러오기
	Map<String, Object> selectNoticeList(SearchCriteria cri) throws SQLException;

	// 해당 공지사항 게시글 불러오기
	NoticeVO selectNoticeByNotice_no(int notice_no) throws SQLException;

	// 공지사항 등록하기
	void registNotice(NoticeVO notice) throws SQLException;

	// 공지사항 수정하기
	void modifyNotice(NoticeVO notice) throws SQLException;

	// 공지사항 삭제하기
	void deleteNotice(NoticeVO notice) throws SQLException;

	// FAQ 게시글 목록 불러오기
	Map<String, Object> selectFaqList(SearchCriteria cri) throws SQLException;

	// FAQ 게시글 수정하기
	void modifyFaq(FaqVO faq) throws SQLException;

	// FAQ 게시글 삭제하기
	void deleteFaq(FaqVO faq) throws SQLException;

	// FAQ 게시글 등록하기
	void registFaq(FaqVO faq) throws SQLException;

	// 1:1 문의 게시글 목록 불러오기
	Map<String, Object> selectQnaList(SearchCriteria cri) throws SQLException;

	// 해당 1:1문의 게시글 불러오기
	QnaVO selectQnaByQue_no(int que_no) throws SQLException;

	// 해당 1:1문의 게시글 답변 불러오기
	AnswerVO selectAnsByQue_no(int que_no) throws SQLException;

	// 해당 1:1문의 게시글의 답변 등록하기
	void registAns(AnswerVO ans) throws SQLException;

	// 해당 1:1문의 게시글의 답변 수정하기
	void modifyAns(AnswerVO ans) throws SQLException;

	// 해당 이벤트 목록을 불러오기
	Map<String, Object> selectEventList(SearchCriteria cri) throws SQLException;

	// 이벤트 메인페이지 각 이벤트 목록을 불러오기
	Map<String, Object> selectEventListForMain() throws SQLException;

	// 이벤트 등록하기
	void registEvent(EventVO event) throws SQLException;

	// 해당하는 이벤트 게시글 조회
	EventVO selectEventByEvent_no(int event_no) throws SQLException;

	// 이벤트 게시글 이미지 경로 수정
	void modifyEventContent(Map<String, Object> modifyEventContentMap) throws SQLException;

	// 해당하는 이벤트 게시글 수정
	void modifyEvent(EventVO event) throws SQLException;

	// 해당하는 이벤트 게시글 삭제
	void deleteEvent(int event_no) throws SQLException;

	// 지난 이벤트 게시글 목록 불러오기
	Map<String, Object> selectEventListforPast(SearchCriteria cri) throws SQLException;

	// 당첨자발표 게시글 등록하기
	void registWinnerBoard(WinnerBoardVO wb) throws SQLException;

	// 해당 당첨자발표 게시글 조회
	WinnerBoardVO selectWbByEvent_no(int event_no) throws SQLException;

	// 해당 당첨자발표 게시글 수정
	void modifyWinnerBoard(WinnerBoardVO wb) throws SQLException;

	// 해당 당첨자발표 게시글 삭제
	void deleteWinnerBoard(WinnerBoardVO wb) throws SQLException;
	
	// 메인용 공지사항 게시글 목록 가져오기
	List<NoticeVO> selectNoticeForMain() throws SQLException;

	// 메인용 1:1문의 게시글 목록 가져오기
	List<QnaVO> selectQnaForMain() throws SQLException;

	// 메인용 1:1문의 게시글 목록 가져오기
	List<EventVO> selectEventForMain() throws SQLException;

	// 메인용 상영영화 목록 가져오기
	List<MovieVO> selectCurrentMovieForMain() throws SQLException;


}
