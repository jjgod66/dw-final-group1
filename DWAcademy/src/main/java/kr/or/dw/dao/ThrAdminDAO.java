package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.aop.ThrowsAdvice;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.AdminVO;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.ClickMovieInfoVO;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.HouseVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.QnaVO;
import kr.or.dw.vo.ScreenVO;
import kr.or.dw.vo.TheaterVO;

@Mapper
public interface ThrAdminDAO {

	//상영 영화 스크린리스트 가져오기 
	List<MovieVO> selectAllScreens() throws SQLException;
	
	List<MovieVO> selectAllScreens1() throws SQLException; 
//t상영영화 스타터 시간 쓸려고함 
	List<ScreenVO> selectAllStart() throws SQLException;
	
	//배경색 위한것 
	List<Map<String, Object>> selectAllRe() throws SQLException;
	ClickMovieInfoVO selectAllRe1(String screenCd) throws SQLException;
	
	//해당영화목록 불러 
	List<Map<String, Object>> selectSearchMovieList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;
	
	//ddP예매율 불러 오기 
	double selectReservRatio(String movie_cd) throws SQLException;
	
	//du해당 영화 총 개수 불러
	int selectSearchMovieListCount(SearchCriteria cri) throws SQLException;
	
	//ro여옿영화 갯수 
	int getTotalReCount() throws SQLException;
	
	
	List<MovieVO> selectList(Map<String, Integer> parameterMap) throws SQLException;

	int getTotalReCount1(SearchCriteria cri) throws SQLException;

	List<Map<String, Object>> getAllMovieList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// admin_cd에 해당하는 영화관 정보를 불러온다.
	Map<String, Object> selectThrByAdmin_cd(String admin_cd) throws SQLException;

	// 영화관 INFO 수정
	void modifyThrInfo(TheaterVO thr) throws SQLException;

	// admin_cd에 해당하는 영화관의 상영관 목록을 불러온다.
	List<Map<String, Object>> selectHouseListByAdmin_cd(String admin_cd) throws SQLException;

	// 상영관을 등록한다.
	void insertHouse(HouseVO house) throws SQLException;

	// 해당하는 상영관의 정보를 가져온다.
	HouseVO selectHouseByHouse_no(int house_no) throws SQLException;

	// 상영관을 수정한다.
	void updateHouse(HouseVO house) throws SQLException;

	// 해당하는 공지글 목록을 불러온다.
	List<NoticeVO> selectNoticeList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 공지글 목록의 총 개수를 불러온다.
	int selectSearchNoticeListCount(SearchCriteria cri) throws SQLException;

	// 공지사항 작성
	void insertNotice(NoticeVO notice) throws SQLException;

	// 해당하는 1:1문의 게시글 목록을 불러온다.
	List<QnaVO> selectQnaList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 해당하는 1:1문의 게시글 목록 총 개수를 불러온다.
	int selectSearchQnaListCount(SearchCriteria cri) throws SQLException;

	// 1:1문의 답변 작성
	void insertAns(AnswerVO ans) throws SQLException;

	// 해당 극장에서 진행중인 이벤트 목록 조회
	List<EventVO> selectEventList(SearchCriteria cri) throws SQLException;

	// 해당 극장에서 진행중인 이벤트 목록 총 개수 조회
	int selectSearchEventListCount(SearchCriteria cri) throws SQLException;

	// 지난 이벤트 게시글 목록 불러오기
	List<EventVO> selectEventListforPast(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	// 지난 이벤트 게시글 총 개수 불러오기
	int selectEventListforPastCount(SearchCriteria cri) throws SQLException;

	// 상영시간표에 등록가능한 영화목록을 불러온다.
	List<Map<String, Object>> selectMovieListforMovieMain(Date date) throws SQLException;

	// 상영시간표에 등록된 영화목록을 불러온다.
	List<Map<String, Object>> selectScreenListforMovieMain(Map<String, Object> data) throws SQLException;

}
