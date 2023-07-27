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
import kr.or.dw.vo.CouponVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.PayDetailVO;
import kr.or.dw.vo.PointVO;
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
		
		if(resList.get(0).getMem_coupon_no() != 0) {
			int mem_coupon_no = resList.get(0).getMem_coupon_no();
			reservationDAO.useMemCoupon(mem_coupon_no);
		}
		
		if(resList.get(0).getUse_point() > 0) {
			PointVO point = new PointVO();
			point.setMem_cd(resList.get(0).getMem_cd());
			point.setMerchant_uid(resList.get(0).getMerchant_uid());
			point.setPoint(resList.get(0).getUse_point());
			
			reservationDAO.useMemPoint(point);
		}
		
		mapData.put("merchant_uid", resList.get(0).getMerchant_uid());
		return mapData;
	}

	@Override
	public String pay0InsertRes(List<ReservationVO> resList) throws SQLException {
		for(ReservationVO res : resList) {
			reservationDAO.insertPay0Res(res);
		}
		
		if(resList.get(0).getMem_coupon_no() != 0) {
			int mem_coupon_no = resList.get(0).getMem_coupon_no();
			reservationDAO.useMemCoupon(mem_coupon_no);
		}
		
		String merchant_uid = resList.get(0).getMerchant_uid();
		
		if(resList.get(0).getUse_point() > 0) {
			PointVO point = new PointVO();
			point.setMem_cd(resList.get(0).getMem_cd());
			point.setMerchant_uid(merchant_uid);
			point.setPoint(resList.get(0).getUse_point());
			
			reservationDAO.useMemPoint(point);
		}
		
		return merchant_uid;
	}
	
	@Override
	public Map<String, Object> getReservationResult(String merchant_uid) throws SQLException {
		Map<String, Object> mapData = null;
		List<ReservationVO> resList = null;
		resList = reservationDAO.selectReservationByMUID(merchant_uid);
		
		mapData = reservationDAO.selectPaymentScreenInfo(resList.get(0).getScreen_cd());
		String res_seats = resList.get(0).getRes_seat();
		if(resList.size() > 1) {
			for(int i = 1; i < resList.size(); i++) {
				res_seats += ", " + resList.get(i).getRes_seat();
			}
		}
		
		PayDetailVO payDetail = reservationDAO.selectPayDetailByMUID(merchant_uid);
		
		
		int pay_amount = 0;
		String receipt_url = "";
		
		if(payDetail != null) {
			pay_amount = payDetail.getPaid_amount();
			receipt_url = payDetail.getReceipt_url();
		}
		
		int adult = 0;
		int teen = 0;
		int prefer = 0;
		for(int i = 0; i < resList.size(); i ++) {
			if(resList.get(i).getMem_cat().equals("성인")) {
				adult += 1;
			}else if(resList.get(i).getMem_cat().equals("청소년")) {
				teen += 1;
			}else {
				prefer += 1;
			}
		}
		String mem_cat = "";
		if(adult > 0) {
			mem_cat += "성인 " + adult + "명";
			if(teen > 0) {
				mem_cat += ", 청소년 " + teen + "명";
				if(prefer > 0) {
					mem_cat += ", 우대 " + prefer + "명";
				}
			}else{
				mem_cat += ", 우대 " + prefer + "명";
			}
			
		}else if(teen > 0) {
			mem_cat += "청소년 " + teen + "명";
			if(prefer > 0) {
				mem_cat += ", 우대 " + prefer + "명";
			}
		}else{
			mem_cat += "우대 " + prefer + "명";
		}
		
		mapData.put("reservation", resList.get(0));
		mapData.put("payDetail", payDetail);
		mapData.put("paid_amount", pay_amount);
		mapData.put("receipt_url", receipt_url);
		mapData.put("res_seats", res_seats);
		mapData.put("mem_cat", mem_cat);
		return mapData;
	}

	@Override
	public List<CouponVO> getCouponList(String mem_cd) throws SQLException {
		List<CouponVO> couponList = null;
		couponList = reservationDAO.selectCouponList(mem_cd);
		return couponList;
	}

	@Override
	public int getPoint(String mem_cd) throws SQLException {
		int point = 0;
		List<PointVO> pointList = null;
		pointList = reservationDAO.selectMemPointList(mem_cd);
		
		for(PointVO pointVO : pointList) {
			if(pointVO.getPoint_cd().subSequence(0, 1).equals("A")) {
				point += pointVO.getPoint();
			}else {
				point -= pointVO.getPoint();
			}
		}
		
		return point;
	}

	@Override
	public List<String> getMemLikeThr(String mem_cd) throws SQLException {
		List<String> memLikeThrList = null;
		memLikeThrList = reservationDAO.selectMemLikeThr(mem_cd);
		
		return memLikeThrList;
	}

	@Override
	public Map<String, String> getResSMSInfo(String merchant_uid) throws SQLException {
		List<Map<String, Object>> SMSInfoAll = null;
		SMSInfoAll = reservationDAO.selectResSMSInfo(merchant_uid);
		String stMemPhone = (String) SMSInfoAll.get(0).get("MEM_PHONE");
		String movie_name = (String) SMSInfoAll.get(0).get("MOVIE_NAME");
		Date Dstartdate = (Date) SMSInfoAll.get(0).get("STARTDATE");
		
		Map<String, String> SMSInfo = new HashMap<>();
		
		String mem_phone = stMemPhone.replace("-", "");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String startdate = format.format(Dstartdate);
		
		SMSInfo.put("mem_phone", mem_phone);
		SMSInfo.put("movie_name", movie_name);
		SMSInfo.put("startdate", startdate);
		SMSInfo.put("merchant_uid", merchant_uid);
		
		return SMSInfo;
	}


}
