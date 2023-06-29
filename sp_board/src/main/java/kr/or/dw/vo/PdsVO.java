package kr.or.dw.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class PdsVO {

	private int pno;
	private String title;
	private String writer;
	private String content;
	private int viewcnt;
	private List<AttachVO> attachList;
	private Date regdate;
	private Date updatedate;
	private Date startdate;
	private Date enddate;
	
	public PdsVO () {};

	public PdsVO(int pno, String title, String writer, String content, int viewcnt, Date regdate, Date updatedate,
			Date startdate, Date enddate, List<AttachVO> attachList) {
		super();
		this.pno = pno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewcnt = viewcnt;
		this.regdate = regdate;
		this.updatedate = updatedate;
		this.startdate = startdate;
		this.enddate = enddate;
		this.attachList = attachList;
	};
	
	
}
