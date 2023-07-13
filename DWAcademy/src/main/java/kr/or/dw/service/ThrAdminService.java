package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ScreenVO;

public interface ThrAdminService {
	
	//상영영화 불러오
	List<MovieVO> getAllScreens()throws SQLException;
	
	//상영영화 정보 불러오기
	List<ScreenVO> getallStart() throws SQLException;

	//영화 관리 리스트에서 테이블안에 배경색지정 정보 가져오기 
	List<Map<String, Object>> getAllRe() throws SQLException;

}
