package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.ScreenSchedualCommand;

public interface ReservationService {

	/**
	 * 영화를 상영하는 지점 리스트를 가져오는 메서드
	 * @param movie_cd
	 * @param date 
	 * @return
	 */
	List<Map<String, String>> getMovieTheater(String movie_cd, String date) throws SQLException;

	/**
	 * 모든 영화관정보를 가져오는 메서드
	 * @return
	 */
	List<Map<String, Object>> getAllTheater() throws SQLException;

	/**
	 * 영화코드, 날짜, 지점에 따른 상영 시간표 가져오는 메서드
	 * @param data
	 * @return
	 */
	List<ScreenSchedualCommand> getScreenSchedual(Map<String, Object> data) throws SQLException;

}
