package kr.or.dw.service;

import java.util.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.PhotoTicketDAO;
import kr.or.dw.vo.PayDetailVO;
import kr.or.dw.vo.PhotoTicketVO;

public class PhotoTicketServiceImpl implements PhotoTicketService{

	@Autowired
	private PhotoTicketDAO photoTicketDAO;

	@Override
	public Map<String, Object> getMovieInfo(String merchant_uid) throws SQLException {
		Map<String, Object> dataMap = null;
		dataMap = photoTicketDAO.selectPTMovieInfo(merchant_uid);
		
		Date startdate = (Date) dataMap.get("STARTDATE");
		
		SimpleDateFormat hour = new SimpleDateFormat("HH");
		SimpleDateFormat min = new SimpleDateFormat("mm");
		
		int starth = Integer.parseInt(hour.format(startdate));
		int startm = Integer.parseInt(min.format(startdate));
		
		int endh = starth + Integer.parseInt(String.valueOf(dataMap.get("MOVIE_LENGTH"))) / 60;
		int endm = startm + Integer.parseInt(String.valueOf(dataMap.get("MOVIE_LENGTH"))) % 60;
		
		String starttime = "";
		if(starth < 10) {
			starttime += "0" + starth;
		}else {
			starttime += starth;
		}
		starttime += " : ";
		if(startm < 10) {
			starttime += "0" + startm;
		}else {
			starttime += startm;
		}
		
		String endtime = "";
		if(endh < 10) {
			endtime += "0" + endh;
		}else {
			endtime += endh;
		}
		endtime += " : ";
		if(endm < 10) {
			endtime += "0" + endm;
		}else {
			endtime += endm;
		}
		
		dataMap.put("starttime", starttime);
		dataMap.put("endtime", endtime);
		return dataMap;
	}

	@Override
	public void payPhotoTicket(PayDetailVO payDetail, PhotoTicketVO photoTicket) throws SQLException {
		photoTicketDAO.insertPayDetailPhotoTicket(payDetail);
		
		photoTicket.setPt_cd(payDetail.getMerchant_uid());
		
		photoTicketDAO.insertPhotoTicket(photoTicket);
		
	}
}
