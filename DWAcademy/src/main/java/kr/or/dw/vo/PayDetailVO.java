package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PayDetailVO {
	private String imp_uid;
	private int apply_num;
	private String card_name;
	private String card_number;
	private String pay_method;
	private int merchant_uid;
	private int card_quota;
	private String status;
	private int paid_amount;
	private String receipt_url;
	private Date refunddate;
}
