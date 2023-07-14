package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SnsVO {
	private String mem_cd;
	private String sns;
	private String sns_name;
	private String sns_email;
	private Date linkdate;
	private String access_token;
	private String refresh_token;
	private String birthyear;
	private String birthdaty;
	private String mem_phone;
}
