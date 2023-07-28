package kr.or.dw.vo;

import lombok.Data;

@Data
public class HouseVO {
	
	private int house_no;
	private String thr_name;
	private String house_name;
	private int house_row;
	private int house_column;
	private String gb_del;
	
	public HouseVO(int house_no, String thr_name, String house_name, int house_row, int house_column, String gb_del) {
		super();
		this.house_no = house_no;
		this.thr_name = thr_name;
		this.house_name = house_name;
		this.house_row = house_row;
		this.house_column = house_column;
		this.gb_del = gb_del;
	}

	public HouseVO() {
	}
	
	
}
