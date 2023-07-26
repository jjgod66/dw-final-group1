package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WinnerBoardVO {

	private int event_no;
	private String winner_content;
	private Date winnerdate;
	
	WinnerBoardVO() {}
}
