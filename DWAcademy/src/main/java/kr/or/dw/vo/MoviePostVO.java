package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MoviePostVO {

	private int mpost_no;
	private String mem_cd;
	private String movie_cd;
	private String mpost_content;
	private int movie_pic_no;
	private String gb_del;
	private Date regdate;
	private Date updatedate;
}
