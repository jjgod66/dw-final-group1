package kr.or.dw.command;

import java.util.Date;

import kr.or.dw.vo.HouseVO;
import kr.or.dw.vo.ScreenVO;
import lombok.Data;

@Data
public class ScreenSchedualCommand {

	private ScreenVO screenVO;
	private HouseVO houseVO;
	private int remainSeat;
}
