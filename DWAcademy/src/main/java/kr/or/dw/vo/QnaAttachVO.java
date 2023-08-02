package kr.or.dw.vo;

import lombok.Data;

@Data
public class QnaAttachVO {
	private int attach_no;
	private int que_no;
	private String attach_path;
	private String attach_type;
}
