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

import kr.or.dw.command.MoviePaymentCommand;
import kr.or.dw.command.ReservationDetailCommand;
import kr.or.dw.command.ScreenSchedualCommand;
import kr.or.dw.dao.ReservationDAO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.PayDetailVO;
import kr.or.dw.vo.ReservationVO;
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
	public ReservationDetailCommand getScreen(String screen_cd) throws SQLException {
		Map<String, Object> map = null;
		map = reservationDAO.selectScreen(screen_cd);
		List<String> buySeatList = null;
		buySeatList = reservationDAO.selectBuySeatList(screen_cd);
		
		map.put("buySeatList", buySeatList);
		ReservationDetailCommand rdc = new ReservationDetailCommand(map);
		
		return rdc;
	}

	@Override
	public List<MovieVO> getAllMovieRes() throws SQLException {
		List<MovieVO> movieList = null;
		movieList = reservationDAO.selectAllMovieRes();
		
		return movieList;
	}

	@Override
	public Map<String, Object> getPaymentScreenInfo(String screen_cd) throws SQLException {
		Map<String, Object> mapData = null;
		mapData = reservationDAO.selectPaymentScreenInfo(screen_cd);
		
		SimpleDateFormat h = new SimpleDateFormat("HH");
		SimpleDateFormat m = new SimpleDateFormat("mm");
		int hh = Integer.parseInt(h.format((Date)mapData.get("STARTDATE")));
		int mm = Integer.parseInt(m.format((Date)mapData.get("STARTDATE")));
		
		int lengthH = Integer.parseInt(String.valueOf(mapData.get("MOVIE_LENGTH"))) / 60;
		int lengthM = Integer.parseInt(String.valueOf(mapData.get("MOVIE_LENGTH"))) % 60;
		hh = hh + lengthH;
		mm = mm + lengthM;
		String endTime = hh + ":" + mm;
		if(hh < 10) {
			endTime = "0" + hh + ":" + mm;
		}
		mapData.put("endTime", endTime);
		
		return mapData;
	}

	@Override
	public Map<String, Object> getReservationResult(List<ReservationVO> resList, PayDetailVO payDetail)
			throws SQLException {
		Map<String, Object> mapData = null;
		reservationDAO.insertPayDetail(payDetail);
		for(ReservationVO res : resList) {
			res.setMerchant_uid(payDetail.getMerchant_uid());
			res.setRes_no(payDetail.getMerchant_uid().replace("M", ""));
			reservationDAO.insertRes(res);
		}
		mapData = reservationDAO.selectPaymentScreenInfo(resList.get(0).getScreen_cd());
		
		mapData.put("merchant_uid", resList.get(0).getMerchant_uid());
		return mapData;
	}

}
