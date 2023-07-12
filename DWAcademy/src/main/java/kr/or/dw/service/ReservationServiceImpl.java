package kr.or.dw.service;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.ScreenSchedualCommand;
import kr.or.dw.dao.ReservationDAO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ScreenVO;

public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDAO reservationDAO;
	
	@Override
	public List<Map<String, String>> getMovieTheater(String movie_cd, String date) throws SQLException{
		List<Map<String, String>> theaterList = null;
		Map<String, String> data = new HashMap<String, String>();
		data.put("movie_cd", movie_cd);
		data.put("date", date);
		
		theaterList = reservationDAO.selectMovieTheater(data);
		
		return theaterList;
	}

	@Override
	public List<Map<String, Object>> getAllTheater() throws SQLException {
		List<Map<String, Object>> allTheaterList = null;
		allTheaterList = reservationDAO.selectAllTheater();
		return allTheaterList;
	}


	@Override
	public List<ScreenSchedualCommand> getScreenSchedual(String movie_cd, String date, String thr_name) throws SQLException {
		List<ScreenSchedualCommand> screenScedual = new ArrayList<ScreenSchedualCommand>();
		Map<String, Object> data = new HashMap<>();
		data.put("movie_cd", movie_cd);
		data.put("date", date);
		data.put("thr_name", thr_name);
		
		List<Map<String, Object>> mapList = null;
		mapList = reservationDAO.selectScreenSchedual(data);
		for(Map<String, Object> map : mapList) {
			String screen_cd = (String) map.get("SCREEN_CD");
			int buySeatCount = reservationDAO.buySeatCount(screen_cd);
			int totalSeat = (Integer.parseInt(String.valueOf(map.get("HOUSE_ROW")))) * (Integer.parseInt(String.valueOf(map.get("HOUSE_COLUMN"))));
			int remainSeat = totalSeat - buySeatCount;
			map.put("remainSeat", remainSeat);
			ScreenSchedualCommand ssc = new ScreenSchedualCommand(map);
			screenScedual.add(ssc);
		}
		
		return screenScedual;
	}

	@Override
	public ScreenVO getScreen(String screen_cd) throws SQLException {
		ScreenVO screen = null;
		screen = reservationDAO.selectScreen(screen_cd);
		
		return screen;
	}

	@Override
	public List<MovieVO> getAllMovieRes() throws SQLException {
		List<MovieVO> movieList = null;
		movieList = reservationDAO.selectAllMovieRes();
		
		return movieList;
	}

}
