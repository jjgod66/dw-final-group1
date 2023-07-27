package kr.or.dw.command;

import lombok.Data;

@Data
public class StoreBuyCommand {
	private String product_cd;
	private int pricesum;
	private int amount;
	private String json;
	private String toname;
	private int tophone;
	private int use_point;
	private int discount;
}
