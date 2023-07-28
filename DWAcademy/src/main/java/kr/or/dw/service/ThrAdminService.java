package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.ClickMovieInfoVO;
import kr.or.dw.vo.HouseVO;
import kr.or.dw.vo.MovieVO;
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

}
