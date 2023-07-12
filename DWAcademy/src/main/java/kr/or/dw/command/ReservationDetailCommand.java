package kr.or.dw.command;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.dw.vo.HouseVO;
import kr.or.dw.vo.MovieVO;
import kr.or.dw.vo.ScreenVO;
import lombok.Data;

@Data
public class ReservationDetailCommand {
	private ScreenVO screenVO;
	private HouseVO houseVO;
	private MovieVO movieVO;
	
	private int remainSeat;
	private String movie_type_des;
	
	private List<String> buySeatList;
	String endTime;
	
	public ReservationDetailCommand(Map<String, Object> map) {
		ScreenVO screenVO = new ScreenVO((String) map.get("SCREEN_CD"), Integer.parseInt(String.valueOf(map.get("HOUSE_NO"))), (String) map.get("MOVIE_CD")
										, (Date) map.get("STARTDATE"), (String) map.get("GB_JOJO"), (String) map.get("MOVIE_TYPE_CD"));
	
		HouseVO houseVO = new HouseVO(Integer.parseInt(String.valueOf(map.get("HOUSE_NO"))), (String) map.get("THR_NAME"), (String) map.get("HOUSE_NAME")
										, Integer.parseInt(String.valueOf(map.get("HOUSE_ROW"))), Integer.parseInt(String.valueOf(map.get("HOUSE_COLUMN"))), (String) map.get("GB_DEL"));
		
		MovieVO movieVO = new MovieVO((String) map.get("MOVIE_CD"), (String) map.get("MOVIE_NAME"), (String) map.get("MOVIE_INFO"), (String) map.get("MOVIE_DIRECTOR")
										, (String) map.get("MOVIE_ACTOR"), (String) map.get("MOVIE_GRADE"), Integer.parseInt(String.valueOf(map.get("MOVIE_LENGTH")))
										, (String) map.get("MOVIE_MAINPIC_PATH"), (Date) map.get("OPENDATE"), (Date) map.get("ENDDATE"));
		
		
		String movie_type_des = (String) map.get("MOVIE_TYPE_DES");
		
		List<String> buySeatList = (List<String>) map.get("buySeatList");
		int buySeatCount = 0;
		if(buySeatList != null) {
			buySeatCount = buySeatList.size();
		}
		int remainSeat = houseVO.getHouse_column()*houseVO.getHouse_row() - buySeatCount;
		SimpleDateFormat h = new SimpleDateFormat("HH");
		SimpleDateFormat m = new SimpleDateFormat("mm");
		int hh = Integer.parseInt(h.format(screenVO.getStartdate()));
		int mm = Integer.parseInt(m.format(screenVO.getStartdate()));
		
		int lengthH = movieVO.getMovie_length() / 60;
		int lengthM = movieVO.getMovie_length() % 60;
		hh = hh + lengthH;
		mm = mm + lengthM;
		String endTime = hh + ":" + mm;
		if(hh < 10) {
			endTime = "0" + hh + ":" + mm;
		}
		
		this.screenVO = screenVO;
		this.houseVO = houseVO;
		this.movieVO = movieVO;
		this.movie_type_des = movie_type_des;
		this.buySeatList = buySeatList;
		this.remainSeat = remainSeat;
		this.endTime = endTime;
	}
}
