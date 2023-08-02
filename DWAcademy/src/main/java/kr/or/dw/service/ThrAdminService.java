package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;


import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.AnswerVO;
import kr.or.dw.vo.ClickMovieInfoVO;
import kr.or.dw.vo.EventVO;
import kr.or.dw.vo.HouseVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.NoticeVO;
import kr.or.dw.vo.QnaVO;
import kr.or.dw.vo.ScreenVO;
import kr.or.dw.vo.TheaterVO;

public interface ThrAdminService {
	
	
	//상영영화 불러오
	List<MovieVO> getAllScreens(int pageNo, int pageSize) throws SQLException;
	
	List<MovieVO> getAllScreens1() throws SQLException;
	//상영영화 정보 불러오기
	List<ScreenVO> getallStart() throws SQLException;

	//영화 관리 리스트에서 테이블안에 배경색지정 정보 가져오기 
	List<Map<String, Object>> getAllRe() throws SQLException;
	
	//클릭한 상영영화의 모든 정보 그냥 다 가져오기 
	ClickMovieInfoVO getMovieInfoByScreenCd(String screenCd) throws SQLException;
	
	//d영화 리스트 불러오기 
	Map<String, Object> selectMovieList(SearchCriteria cri) throws SQLException;
	
	//dud영화 갯수 
	int getTotalReCount() throws SQLException;
	
	//vp페이징 
	List<MovieVO> getAllScreensPaged(int offset, int perPage) throws SQLException;

	Map<String, Object> getAllScreens(SearchCriteria cri) throws SQLException;


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
	void registHouse(HouseVO house) throws SQLException;

	// 해당하는 상영관의 정보를 가져온다.
	HouseVO selectHouseByHouse_no(int house_no) throws SQLException;

	// 상영관을 수정한다.
	void modifyHouse(HouseVO house) throws SQLException;

	// 해당하는 공지글 목록을 불러온다.
	Map<String, Object> selectNoticeList(SearchCriteria cri) throws SQLException;
	
	// 공지사항 작성
	void registNotice(NoticeVO notice) throws SQLException;

	// 해당하는 1:1문의 게시글 목록을 불러온다.
	Map<String, Object> selectQnaList(SearchCriteria cri) throws SQLException;

	// 1:1문의 답변 작성
	void registAns(AnswerVO ans) throws SQLException;

	// 해당 극장에서 진행중인 이벤트 목록 조회
	Map<String, Object> selectEventList(SearchCriteria cri) throws SQLException;
	
	// 지난 이벤트 게시글 목록 불러오기
	Map<String, Object> selectEventListforPast(SearchCriteria cri) throws SQLException;

	// 상영시간표에 등록가능한 영화목록을 불러온다.
	List<Map<String, Object>> selectMovieListforMovieMain(Date date) throws SQLException;

	// 상영시간표에 등록된 영화목록을 불러온다.
	List<Map<String, Object>> selectScreenListforMovieMain(Map<String, Object> data) throws SQLException;

	// 시간표 충돌이 일어나는 스크린 갯수를 세온다.
	int checkScreenTimeClash(Map<String, Object> data) throws SQLException;

	// 새 상영영화를 등록한다.
	void addNewScreen(ScreenVO screen) throws SQLException;

	// 해당하는 상영영화 상세정보를 가져온다.
	Map<String, Object> selectScreenByScreen_cd(String screen_cd) throws SQLException;

	// 기존 상영영화를 수정한다.
	void modifyScreen(ScreenVO screen) throws SQLException;

	// 기존 상영영화를 삭제한다.
	void deleteScreen(ScreenVO screen) throws SQLException;

	// 메인페이지에 보여줄 공지사항 리스트 목록 가져오기
	List<NoticeVO> selectNoticeForMain(String admin_cd) throws SQLException;

	// 메인페이지에 보여줄 1:1문의 리스트 목록 가져오기
	List<QnaVO> selectQnaForMain(String admin_cd) throws SQLException;

	// 메인페이지에 보여줄 이벤트 목록 가져오기
	List<EventVO> selectEventForMain(String admin_cd) throws SQLException;

}
