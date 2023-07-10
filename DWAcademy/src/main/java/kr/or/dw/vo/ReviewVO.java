package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int review_no;
	private String movie_cd;
	private String mem_cd;
	private int review_rating;
	private String review_content;
	private Date regdate;
	private String gb_del;
	private Date updatedate;
}
