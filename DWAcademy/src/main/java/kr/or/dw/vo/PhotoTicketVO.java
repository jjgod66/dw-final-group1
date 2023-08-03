package kr.or.dw.vo;

import lombok.Data;

@Data
public class PhotoTicketVO {
	private String pt_cd;
	private String merchant_uid;
	private String front_path;
	private String back_path;
	private String gb_print;
}
