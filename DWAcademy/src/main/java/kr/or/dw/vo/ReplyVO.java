package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int reply_no;
	private String mem_cd;
	private int mpost_no;
	private String reply_content;
	private Date regdate;
	private Date updatedate;
	private String gb_del;
}
