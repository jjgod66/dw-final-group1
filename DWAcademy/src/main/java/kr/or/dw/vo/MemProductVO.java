package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemProductVO {
	private String mem_product_cd;
	private String mem_cd;
	private String product_cd;
	private String gb_use;
	private Date enddate;
}
