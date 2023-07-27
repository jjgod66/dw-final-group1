package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {

	private String que_no;
	private String que_title;
	private String que_content;
	private String mem_cd;
	private String writer_name;
	private String writer_email;
	private String que_sel;
	private String que_type;
	private String gb_mem;
	private String writer_pwd;
	private String thr_name;
	private Date regdate;
	private String ans_content;
	
	public QnaVO () {}
}
