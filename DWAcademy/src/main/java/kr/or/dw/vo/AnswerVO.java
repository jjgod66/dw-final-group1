package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerVO {
	private int que_no;
	private String admin_cd;
	private String ans_content;
	private Date regdate;
	
	AnswerVO () {}
}                             
