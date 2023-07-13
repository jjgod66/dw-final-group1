package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PayDetailVO {
	private String imp_uid;
	private String apply_num;
	private String card_name;
	private String card_number;
	private int paid_at;
	private String pay_method;
	private String merchant_uid;
	private int card_quota;
	private String status;
	private int paid_amount;
	private String receipt_url;
	private Date refunddate;
	
}
