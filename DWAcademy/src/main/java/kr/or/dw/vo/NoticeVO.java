package kr.or.dw.vo;

import lombok.Data;

@Data
public class NoticeVO {
	private String notice_no;
	private String admin_cd;
	private String notice_title;
	private String notice_content;
	private String notice_thr;
	private String regdate;
	private String updatedate;
	private String gb_del;
	
	public NoticeVO () {}
}
