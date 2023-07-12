package kr.or.dw.command;

import java.util.Date;
import java.util.Map;

import kr.or.dw.vo.HouseVO;
import kr.or.dw.vo.ScreenVO;
import lombok.Data;

@Data
public class ScreenSchedualCommand {
	private ScreenVO screenVO;
	private HouseVO houseVO;
	private int remainSeat;
	private String movie_type_des;
	int movie_length;

	public ScreenSchedualCommand(Map<String, Object> map) {
		ScreenVO screenVO = new ScreenVO((String) map.get("SCREEN_CD"), Integer.parseInt(String.valueOf(map.get("HOUSE_NO"))), (String) map.get("MOVIE_CD"), (Date) map.get("STARTDATE"), (String) map.get("GB_JOJO"), (String) map.get("MOVIE_TYPE_CD"));
	
		HouseVO houseVO = new HouseVO(Integer.parseInt(String.valueOf(map.get("HOUSE_NO"))), (String) map.get("THR_NAME"), (String) map.get("HOUSE_NAME"), Integer.parseInt(String.valueOf(map.get("HOUSE_ROW"))), Integer.parseInt(String.valueOf(map.get("HOUSE_COLUMN"))), (String) map.get("GB_DEL"));
		
		int remainSeat = (int) map.get("remainSeat");
		
		String movie_type_des = (String) map.get("MOVIE_TYPE_DES");
		
		int movie_length = Integer.parseInt(String.valueOf(map.get("MOVIE_LENGTH")));
		
		this.screenVO = screenVO;
		this.houseVO = houseVO;
		this.remainSeat = remainSeat;
		this.movie_type_des = movie_type_des;
		this.movie_length = movie_length;
	}
}
