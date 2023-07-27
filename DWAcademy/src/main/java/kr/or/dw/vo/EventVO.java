package kr.or.dw.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EventVO {
	
	private int event_no;
	private String relate_cd;
	private String event_div;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startdate;
	private Date enddate;
	private String event_title;
	private String event_content;
	private String event_pic_path;
	private Date regdate;
	private String event_thum_path;
	private String winner_content;
	private String winnerdate;
}
