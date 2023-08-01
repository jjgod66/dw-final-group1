package kr.or.dw.command;

import java.util.Date;

import lombok.Data;

@Data
public class CheckScreenTimeClashCommand {
	private int house_no;
	private Date startTime;
	private Date endTime;
	
	public CheckScreenTimeClashCommand(){}
}
