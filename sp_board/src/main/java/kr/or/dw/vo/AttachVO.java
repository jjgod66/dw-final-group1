package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AttachVO {

	private int ano;
	private String uploadpath;
	private String filename;
	private String filetype;
	private int pno;
	private String attacher;
	private Date regdate;
	
	public AttachVO () {};

	public AttachVO(int ano, String uploadpath, String filename, String filetype, int pno, String attacher,
			Date regdate) {
		super();
		this.ano = ano;
		this.uploadpath = uploadpath;
		this.filename = filename;
		this.filetype = filetype;
		this.pno = pno;
		this.attacher = attacher;
		this.regdate = regdate;
	};
	
	
}
