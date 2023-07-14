package kr.or.dw.command;

import lombok.Data;

@Data
public class GiftSMSCommand {
	private String toname;
	private int tophone;
	private String product_name;
	private int product_period;
	private String mem_name;
	private String merchant_uid;
}
