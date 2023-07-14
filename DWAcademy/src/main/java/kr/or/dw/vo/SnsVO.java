package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SnsVO {
	private String mem_cd;
	private String sns;
	private Date linkdate;
	private String access_token;
	private String refresh_token;
	private String sns_email;
}
