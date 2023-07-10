package kr.or.dw.vo;

import lombok.Data;

@Data
public class AdminVO {
	
	private String admin_cd;
	private String thr_name;
	private String admin_id;
	private String admin_pwd;
	
	public AdminVO() {};
	
	public AdminVO(String admin_cd, String thr_name, String admin_id, String admin_pwd) {
		super();
		this.admin_cd = admin_cd;
		this.thr_name = thr_name;
		this.admin_id = admin_id;
		this.admin_pwd = admin_pwd;
	}
	
	
}
