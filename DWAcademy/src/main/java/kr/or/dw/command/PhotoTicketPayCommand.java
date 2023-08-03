package kr.or.dw.command;

import lombok.Data;

@Data
public class PhotoTicketPayCommand {

	private String json;
	private String merchant_uid;
	private String front_path;
	private String back_path;
	
}
