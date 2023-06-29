package kr.or.dw.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.dw.vo.PdsVO;
import lombok.Data;

@Data
public class PdsRegistCommand {

	private String title;
	private String content;
	private String writer;
	private List<MultipartFile> uploadFile;
	private int pno;
	
	public PdsVO toPdsVO() {
		PdsVO pds = new PdsVO();
		pds.setTitle(title);
		pds.setContent(content);
		pds.setWriter(writer);
		pds.setPno(pno);
		
		return pds;
	}
	
}
