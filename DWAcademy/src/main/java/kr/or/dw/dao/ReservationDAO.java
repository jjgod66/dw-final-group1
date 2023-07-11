package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.command.ScreenSchedualCommand;

@Mapper
public interface ReservationDAO {

	/**
	 * 영화를 상영하는 지점 리스트를 가져오는 메서드
	 * @param movie_cd
	 * @param date 
	 * @return
	 */
	List<Map<String, String>> selectMovieTheater(String movie_cd, String date) throws SQLException;

	/**
	 * 모든 영화관정보를 가져오는 메서드
	 * @return
	 */
	List<Map<String, Object>> selectAllTheater() throws SQLException;

	List<Map<String, String>> selectMovieTheater(Map<String, String> data) throws SQLException;

	List<ScreenSchedualCommand> selectScreenSchedual(Map<String, Object> data) throws SQLException;

}
