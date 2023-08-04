package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Admin_NoteVO {
	private int note_no;
	private String note_sender;
	private String note_receiver;
	private String note_title;
	private String note_content;
	private Date senddate;
	private String gb_del_sender;
	private String gb_del_receiver;
	
	Admin_NoteVO () {}
}
