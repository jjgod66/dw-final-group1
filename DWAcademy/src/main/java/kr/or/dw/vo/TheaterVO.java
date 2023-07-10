package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TheaterVO {

	private String thr_name;
	private String thr_loc;
	private double thr_y;
	private double thr_x;
	private String thr_addr;
	private String thr_addr_detail;
	private String thr_info;
	private String admin_id;
	private String admin_pwd;
	private String thr_tel;
	private Date regdate;
	
	TheaterVO () {}

	public TheaterVO(String thr_name, String thr_loc, double thr_y, double thr_x, String thr_addr,
			String thr_addr_detail, String thr_info, String admin_id, String admin_pwd, String thr_tel, Date regdate) {
		super();
		this.thr_name = thr_name;
		this.thr_loc = thr_loc;
		this.thr_y = thr_y;
		this.thr_x = thr_x;
		this.thr_addr = thr_addr;
		this.thr_addr_detail = thr_addr_detail;
		this.thr_info = thr_info;
		this.admin_id = admin_id;
		this.admin_pwd = admin_pwd;
		this.thr_tel = thr_tel;
		this.regdate = regdate;
	};

	
	
}
