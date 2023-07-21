package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PointVO {
	private String point_cd;
	private String mem_cd;
	private String merchant_uid;
	private int point;
	private Date regdate;
}
