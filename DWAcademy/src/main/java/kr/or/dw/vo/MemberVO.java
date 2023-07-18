package kr.or.dw.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {

	private String mem_cd;
	private String mem_id;
	private String mem_pwd;
	private String pwd_re;
	private String mem_email;
	private String mem_name;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date mem_bir;
	private String mem_phone;
	private String mem_zipcode;
	private String mem_addr;
	private String mem_addr_detail;
	private String gb_sms_alert;
	private String gb_email_alert;
	private String mem_pic_path;
	private String mem_grade;
	private Date regdate;
	private String gb_del;
	private Date deldate;
	private String gb_ban;
	private Date stopdate;
	private String gb_sleep;
	private Date lastlogindate;
	private String gb;
}
