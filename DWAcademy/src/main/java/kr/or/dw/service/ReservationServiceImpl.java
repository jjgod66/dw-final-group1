package kr.or.dw.service;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.ReservationDAO;

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
//		theaterList = reservationDAO.selectMovieTheater(movie_cd, date);
		
		return theaterList;
	}

	@Override
	public List<Map<String, Object>> getAllTheater() throws SQLException {
		List<Map<String, Object>> allTheaterList = null;
		allTheaterList = reservationDAO.selectAllTheater();
		return allTheaterList;
	}

}
