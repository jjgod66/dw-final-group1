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
	private int houseCnt;
	
	public TheaterVO () {}

	
}
