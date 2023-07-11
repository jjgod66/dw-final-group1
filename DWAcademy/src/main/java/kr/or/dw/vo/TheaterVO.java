package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TheaterVO {

	private String thr_name;
	private String thr_loc;
	private String thr_y;
	private String thr_x;
	private String thr_addr;
	private String thr_addr_detail;
	private String thr_addr_post;
	private String thr_info;
	private String admin_id;
	private String admin_pwd;
	private String admin_cd;
	private String thr_tel;
	private Date regdate;
	private String gb_del;
	
	TheaterVO () {}

	public TheaterVO(String thr_name, String thr_loc, String thr_y, String thr_x, String thr_addr,
			String thr_addr_detail, String thr_addr_post, String thr_info, String admin_id, String admin_pwd,
			String admin_cd, String thr_tel, Date regdate, String gb_del) {
		super();
		this.thr_name = thr_name;
		this.thr_loc = thr_loc;
		this.thr_y = thr_y;
		this.thr_x = thr_x;
		this.thr_addr = thr_addr;
		this.thr_addr_detail = thr_addr_detail;
		this.thr_addr_post = thr_addr_post;
		this.thr_info = thr_info;
		this.admin_id = admin_id;
		this.admin_pwd = admin_pwd;
		this.admin_cd = admin_cd;
		this.thr_tel = thr_tel;
		this.regdate = regdate;
		this.gb_del = gb_del;
	}
	
}
