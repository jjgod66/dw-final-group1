package kr.or.dw.vo;

import lombok.Data;

@Data
public class FaqVO {
	private String faq_no;
	private String faq_title;
	private String faq_content;
	private String regdate;
	private String updatedate;
	private String gb_del;
	private String faq_div;
	public FaqVO () {}
}
